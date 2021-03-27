import 'package:flutter/material.dart';
class ViewJobCard extends StatelessWidget {
  ViewJobCard({this.jobTitle,this.companyName,this.onTap});
  final String jobTitle,companyName;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        title: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text(companyName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
        ),
        subtitle: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text(jobTitle),
        ),
        onTap:onTap,
      ),
    );
  }
}
