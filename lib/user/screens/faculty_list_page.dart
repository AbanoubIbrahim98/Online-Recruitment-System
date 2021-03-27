import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/user/model/provider_class.dart';
import 'package:resume/user/widgets/chat_widgets.dart';
import 'package:resume/user/widgets/container_bottom_sheet.dart';



class FacultyListPage extends StatelessWidget {
  FacultyListPage({this.companyMail});
  final String companyMail;
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<GetListView>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0DA2A6),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Choose Faculty",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Color(0xff0DA2A6),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xffF3F3F3),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Text(
                  "Choose from list below",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0DA2A6)),
                ),
              ),
              SizedBox(height: 30,),
              ContainerBottomSheet(
                text: 'Faculty Of Engineering',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'Faculty Of Engineering',
                    ),
                    whatAboutQuestion('Please, Choose your Grade:'),
                    chooseFromListGradeActive(companyMail,'Faculty Of Engineering',)
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              ContainerBottomSheet(
                text: 'Faculty Of Computer Science',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'Faculty Of Computer Science',
                    ),
                    whatAboutQuestion('Please, Choose your Grade:'),
                    chooseFromListGradeActive(companyMail,'Faculty Of Computer Science',)

                  ]);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

