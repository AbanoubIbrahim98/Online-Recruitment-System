import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/company/screens/emp_details.dart';

class EmpCard extends StatelessWidget {
  EmpCard({this.empName});
  final String empName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      color: Color(0xff0DA2A6),
      child: ListTile(
        title: Text(
          empName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmpDetails(
                name: empName,
              ),
            ),
          );
        },
      ),
    );
  }
}
