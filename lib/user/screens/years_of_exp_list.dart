import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/user/model/provider_class.dart';
import 'package:resume/user/widgets/chat_widgets.dart';
import 'package:resume/user/widgets/container_bottom_sheet.dart';


class YearsOfExpPage extends StatelessWidget {
  YearsOfExpPage({this.companyMail,this.faculty,this.grade,this.year});
  final String companyMail,faculty,year,grade;
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<GetListView>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0DA2A6),
        appBar: AppBar(
          title: Text(
            "Years Of Experience",
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
              Text(
                "Choose Years Of Experience",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0DA2A6)),
              ),
              SizedBox(height: 20,),
              ContainerBottomSheet(
                text: '1:3 years',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'Years of Experience 1:3 years',
                    ),
                    whatAboutQuestion('Please, enter skills ..'),
                    showTextFieldSkills(context,companyMail,faculty,grade,year,'1:3 years'),
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 20,),
              ContainerBottomSheet(
                text: '3:5 years',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'Years of Experience 3:5 years',
                    ),
                    whatAboutQuestion('Please, enter skills ..'),
                    showTextFieldSkills(context,companyMail,faculty,grade,year,'3:5 years'),
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 20,),
              ContainerBottomSheet(
                text: '5:7 years',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'Years of Experience 5:7 years',
                    ),
                    whatAboutQuestion('Please, enter skills ..'),
                    showTextFieldSkills(context,companyMail,faculty,grade,year,'5:7 years'),
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 20,),
              ContainerBottomSheet(
                text: '+7 years',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'Years of Experience +7 years',
                    ),
                    whatAboutQuestion('Please, enter skills ..'),
                    showTextFieldSkills(context,companyMail,faculty,grade,year,'+7 years'),
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

