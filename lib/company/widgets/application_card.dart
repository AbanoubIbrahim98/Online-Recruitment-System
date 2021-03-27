import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/company/screens/emplyees.dart';

class ApplicationCard extends StatelessWidget {
  ApplicationCard({this.jobTitle});

  final String jobTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      color: Color(0xff0DA2A6),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        title: Text(
          jobTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Employees(
                jobTitle: jobTitle,
              ),
            ),
          );
        },
      ),
    );
  }
}
