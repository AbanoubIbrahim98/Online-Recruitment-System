import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/user/model/provider_class.dart';
import 'package:resume/user/screens/faculty_list_page.dart';
import 'package:resume/user/screens/garde_list_page.dart';
import 'package:resume/user/screens/skills_list_page.dart';
import 'package:resume/user/screens/year_of_grade_list.dart';
import 'package:resume/user/screens/years_of_exp_list.dart';

//------------------------------------------------
String name, address, phone, mail, faculty, grade, year, numOfYears, skills;
//---------------------------------------------------
Widget hiMessage() {
  return Builder(
    builder: (context) => Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 20,
        vertical: MediaQuery.of(context).size.width / 20,
      ),
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.only(top: 20, right: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                "Hi, I will ask you some questions to fulfill your Cv !",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Color(0xffF3F3F3),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xff07D8D3),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xff0DA2A6),
                  child: Image.asset("images/chat.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//---------------------------------------------------
Widget whatAboutQuestion(String question) {
  return Builder(
    builder: (context) => Container(
      margin: EdgeInsets.only(
          bottom: 20,
          right: MediaQuery.of(context).size.width / 20,
          left: MediaQuery.of(context).size.width / 20),
      child: Card(
        margin: EdgeInsets.only(right: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            question,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    ),
  );
}

//---------------------------------------------------
Widget chooseFromListFacultyActive(String companyMail) {
  return Builder(
    builder: (context) => Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color(0xff0DA2A6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FacultyListPage(companyMail: companyMail,),
                ),
              );
            },
            child: Text(
              "Choose from List ..",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget chooseFromListGradeActive(String companyMail,faculty) {
  return Builder(
    builder: (context) {
      return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Color(0xff0DA2A6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GradeListPage(companyMail: companyMail,faculty: faculty,),
                  ),
                );
              },
              child: Text(
                "Choose from List ..",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget chooseFromListYearActive(String companyMail,faculty,grade) {
  return Builder(
    builder: (context) {
      return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Color(0xff0DA2A6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YearOfGradePage(companyMail: companyMail,faculty: faculty,grade: grade,),
                  ),
                );
              },
              child: Text(
                "Please, choose graduation year:",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget chooseFromListSkillsActive() {
  return Builder(
    builder: (context) {
      return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Color(0xff0DA2A6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SkillsListPage(),
                  ),
                );
              },
              child: Text(
                "Choose from list ..",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget chooseFromListYearsOfExpActive(String companyMail,faculty,grade,year) {
  return Builder(
    builder: (context) {
      return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Color(0xff0DA2A6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YearsOfExpPage(companyMail: companyMail,faculty:faculty ,grade: grade,year: year,),
                  ),
                );
              },
              child: Text(
                "Choose from list:",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      );
    },
  );
}

//-----------------------------------------
Widget chooseFromListFacultyInactive() {
  return Builder(
    builder: (context) => Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.teal[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlatButton(
            onPressed: null,
            child: Text(
              "Choose from List ..",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    ),
  );
}

//---------------------------------------------------
Widget chosenOptionCard(String label) {
  return Builder(
      builder: (context) => Container(
            margin: EdgeInsets.only(
                bottom: 20,
                right: MediaQuery.of(context).size.width / 20,
                left: MediaQuery.of(context).size.width / 20),
            child: Card(
              color: Color(0xff0DA2A6),
              margin: EdgeInsets.only(right: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  label,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ));
}

//---------------------------------------------------
Widget lastReply() {
  return Builder(
    builder: (context) => Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 20,
        right: MediaQuery.of(context).size.width / 20,
        bottom: MediaQuery.of(context).size.width / 20,
      ),
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.only(top: 20, right: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                "Your CV is now complete. We'll contact you as soon as possible ",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Color(0xffF3F3F3),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xff07D8D3),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xff0DA2A6),
                  child: Image.asset("images/chat.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//---------------------------------------------------
Widget showTextFieldName(String companyMail) {
  return Builder(
    builder: (context) => Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: TextField(
        onChanged: (val) {
          name = val;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () async {
              if (name != null) {
                var myProvider = Provider.of<GetListView>(context);
                myProvider.removeFromList();
                myProvider.addToList([
                  chosenOptionCard('Name: $name'),
                  whatAboutQuestion('Please, enter your address:'),
                  showTextFieldAddress(companyMail),
                ]);

              }
            },
            icon: CircleAvatar(
              backgroundColor: Color(0xff0DA2A6),
              child: Image.asset(
                "images/send.png",
                height: 20,
                width: 20,
              ),
            ),
          ),
          hintText: 'enter name ..',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ),
    ),
  );
}

//-------------------------------------------------------------------
Widget showTextFieldAddress(String companyMail) {
  return Builder(
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: TextField(
          onChanged: (val) {
            address = val;
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () async {
                if (address != null) {
                  var myProvider = Provider.of<GetListView>(context);
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chosenOptionCard("Address: $address"),
                    whatAboutQuestion('Please, enter your phone number:'),
                    showTextFieldPhone( companyMail),
                  ]);

                }
              },
              icon: CircleAvatar(
                backgroundColor: Color(0xff0DA2A6),
                child: Image.asset(
                  "images/send.png",
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            hintText: 'enter address:',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      );
    },
  );
}

Widget showTextFieldPhone(String companyMail) {
  return Builder(
    builder: (context) {
      var myProvider = Provider.of<GetListView>(context);
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: TextField(
          onChanged: (val) {
            phone = val;
          },
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () async {
                if (phone != null) {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chosenOptionCard("Phone: $phone"),
                    whatAboutQuestion('Please, enter your mail:'),
                    showTextFieldMail(companyMail)
                  ]);

                }
              },
              icon: CircleAvatar(
                backgroundColor: Color(0xff0DA2A6),
                child: Image.asset(
                  "images/send.png",
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            hintText: 'enter phone number ..',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      );
    },
  );
}

Widget showTextFieldMail(String companyMail) {
  return Builder(
    builder: (context) {
      var myProvider = Provider.of<GetListView>(context);
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: TextField(
          onChanged: (val) {
            mail = val;
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () async {
                if (mail != null) {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chosenOptionCard("E-mail: $mail"),
                    whatAboutQuestion('Please, choose your faculty:'),
                    chooseFromListFacultyActive(companyMail)
                  ]);

                }
              },
              icon: CircleAvatar(
                backgroundColor: Color(0xff0DA2A6),
                child: Image.asset(
                  "images/send.png",
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            hintText: 'enter mail ..',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      );
    },
  );
}

Widget showTextFieldSkills(BuildContext context,String companyMail,faculty,grade,year,num) {
  return Builder(
    builder: (context) {
      var myProvider = Provider.of<GetListView>(context);
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: TextField(
          onChanged: (val) {
            skills = val;
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () async {
                if (skills != null) {
                  myProvider.removeFromList();
                  myProvider.addToList(
                      [chosenOptionCard("Skills: $skills"), okButton(companyMail,faculty,grade,year,num)]);
                }
              },
              icon: CircleAvatar(
                backgroundColor: Color(0xff0DA2A6),
                child: Image.asset(
                  "images/send.png",
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            hintText: 'enter skills ..',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      );
    },
  );
}

Widget okButton(String companyMail,faculty,grade,year,num) {
  return Builder(builder: (context)=>FlatButton(
    color: Color(0xff0DA2A6),
    padding: EdgeInsets.all(20),
    onPressed: () async{
      var myProvider = Provider.of<GetListView>(context);
      var _auth = FirebaseAuth.instance;
      String loggedUser = _auth.currentUser.email;
      var _fireStore = FirebaseFirestore.instance;
      await _fireStore.collection('applications').add({
        'name': name,
        'address':address,
        'phone': phone,
        'mail': mail,
        'faculty':faculty ,
        'grade':grade ,
        'year':year ,
        'numOfYears':num ,
        'skills':skills ,
        'sender':loggedUser,
        'companyMail':  companyMail ,
        'jobTitle':myProvider.jobTitleProvider,
        'sort': DateTime.now().millisecondsSinceEpoch
      });
      Navigator.pop(context);
    },
    child: Text('Submit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
  ));
}
