import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resume/company/widgets/label_info.dart';
var _fireStore = FirebaseFirestore.instance;

class EmpDetails extends StatefulWidget {
  EmpDetails({this.name});

  final String name;

  @override
  _EmpDetailsState createState() => _EmpDetailsState();
}

class _EmpDetailsState extends State<EmpDetails> {
  String address, phone, mail, faculty, grade, year, numOfYears, skills;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Employee Info",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Color(0xff0DA2A6),
      ),
      //Stream builder to get data from collection applications
      body: StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('applications').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var snap = snapshot.data.docs;
          for (var item in snap) {
            if (widget.name == item.data()['name']) {
               address = item.data()['address'];
               phone = item.data()['phone'];
               mail = item.data()['mail'];
               faculty = item.data()['faculty'];
               grade = item.data()['grade'];
               year = item.data()['year'];
               numOfYears = item.data()['numOfYears'];
               skills = item.data()['skills'];
            }
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LabelInfo(label:'Emp Name: ${widget.name}'),
              LabelInfo(label:'Phone: $phone'),
              LabelInfo(label: 'Mail: $mail',),
              LabelInfo(label: 'Faculty: $faculty',),
              LabelInfo(label: 'Grade: $grade',),
              LabelInfo(label: 'Year: $year',),
              LabelInfo(label: 'num Of Years: $numOfYears',),
              LabelInfo(label: 'Skills: $skills',),
            ],
          );
        },
      ),
    );
  }
}
