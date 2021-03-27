import 'package:flutter/material.dart';

class LabelInfo extends StatelessWidget {
  LabelInfo({this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      padding: EdgeInsets.all(15),
      color: Color(0xff0DA2A6),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
