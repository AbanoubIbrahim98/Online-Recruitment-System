import 'package:flutter/material.dart';

class ContainerBottomSheet extends StatelessWidget {
  ContainerBottomSheet({this.text, this.onTap});
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.blue),
            ),
            Divider(
              height: 30,
              thickness: 1,
              indent: MediaQuery.of(context).size.width / 5,
              endIndent: MediaQuery.of(context).size.width / 5,
            ),
          ],
        ),
      ),
    );
  }
}
