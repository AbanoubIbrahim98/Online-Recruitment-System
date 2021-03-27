import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/user/model/provider_class.dart';
import 'package:resume/user/widgets/chat_widgets.dart';
import '../widgets/container_bottom_sheet.dart';

class YearOfGradePage extends StatelessWidget {
  YearOfGradePage({this.companyMail,this.faculty,this.grade});
  final String  companyMail,faculty,grade;
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<GetListView>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0DA2A6),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Year Of Graduation",
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
                "Choose Year Of Graduation:",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0DA2A6)),
              ),
              SizedBox(
                height: 20,
              ),
              ContainerBottomSheet(
                text: '2016',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'سنة التخرج : 2016',
                    ),
                    whatAboutQuestion('اختر سنة عدد سنوات الخبرة'),
                    chooseFromListYearsOfExpActive(companyMail,faculty,grade,'2016')
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              ContainerBottomSheet(
                text: '2017',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'سنة التخرج : 2017',
                    ),
                    whatAboutQuestion('اختر سنة عدد سنوات الخبرة'),
                    chooseFromListYearsOfExpActive(companyMail,faculty,grade,'2017')
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              ContainerBottomSheet(
                text: '2018',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'سنة التخرج : 2018',
                    ),
                    whatAboutQuestion('اختر سنة عدد سنوات الخبرة'),
                    chooseFromListYearsOfExpActive(companyMail,faculty,grade,'2018')
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              ContainerBottomSheet(
                text: '2019',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'سنة التخرج : 2019',
                    ),
                    whatAboutQuestion('اختر سنة عدد سنوات الخبرة'),
                    chooseFromListYearsOfExpActive(companyMail,faculty,grade,'2019')
                  ]);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              ContainerBottomSheet(
                text: '2020',
                onTap: () {
                  myProvider.removeFromList();
                  myProvider.addToList([
                    chooseFromListFacultyInactive(),
                    chosenOptionCard(
                      'سنة التخرج : 2020',
                    ),
                    whatAboutQuestion('اختر سنة عدد سنوات الخبرة'),
                    chooseFromListYearsOfExpActive(companyMail,faculty,grade,'2020')
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
