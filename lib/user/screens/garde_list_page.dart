import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/user/model/provider_class.dart';
import 'package:resume/user/widgets/chat_widgets.dart';
import 'package:resume/user/widgets/container_bottom_sheet.dart';


class GradeListPage extends StatelessWidget {
  GradeListPage({this.companyMail,this.faculty});
  final String companyMail,faculty;
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<GetListView>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0DA2A6),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Choose Grade",
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Choose Your Grade",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0DA2A6)),
              ),
              SizedBox(
                height: 30,
              ),
              ContainerBottomSheet(
                text: 'Pass',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'Grade: Pass',
                    ),
                    whatAboutQuestion('Please, choose graduation year:'),
                    chooseFromListYearActive(companyMail,faculty,'Pass')
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              ContainerBottomSheet(
                text: 'Good',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'Grade: good',
                    ),
                    whatAboutQuestion('Please, choose graduation year:'),
                    chooseFromListYearActive(companyMail,faculty,'Good')
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              ContainerBottomSheet(
                text: 'Very Good',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'Grade: Very Good',
                    ),
                    whatAboutQuestion('Please, choose graduation year:'),
                    chooseFromListYearActive(companyMail,faculty,'Very Good')
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              ContainerBottomSheet(
                text: 'Excellent',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'Grade: Excellent',
                    ),
                    whatAboutQuestion('Please, choose graduation year:'),
                    chooseFromListYearActive(companyMail,faculty,'Excellent')
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
