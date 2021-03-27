import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resume/company/widgets/application_card.dart';


class Applications extends StatefulWidget {
  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  var _fireStore = FirebaseFirestore.instance;
  String loggedUser;

  //used to get Logged User
  @override
  void initState() {
    var _auth = FirebaseAuth.instance;
    loggedUser = _auth.currentUser.email;
    print(loggedUser);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Applications",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Color(0xff0DA2A6),
      ),

      //Stream builder to get data from collection postJob
      body: StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('postJob').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var snap = snapshot.data.docs;
          List<ApplicationCard> cardList = [];
          for (var item in snap) {
            if(loggedUser==item.data()['companyMail']){
              String jobTitle = item.data()['jobTitle'];
              var itemCard = ApplicationCard(
                jobTitle: jobTitle,
              );
              cardList.add(itemCard);
            }

          }
          return ListView(
            padding: EdgeInsets.all(15),
            children: cardList,
          );
        },
      ),
    );
  }
}
