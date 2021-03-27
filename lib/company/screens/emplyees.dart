import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resume/company/widgets/emp_card.dart';

class Employees extends StatefulWidget {
  Employees({this.jobTitle});

  final String jobTitle;

  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  var _fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    print(widget.jobTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Employees",
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
          List<EmpCard> cardList = [];
          for (var item in snap) {
            if (widget.jobTitle == item.data()['jobTitle']) {
              String empName = item.data()['name'];
              var itemCard = EmpCard(
                empName: empName,
              );
              cardList.add(itemCard);
            }
          }
          return ListView(
            padding: EdgeInsets.all(15),
            children: cardList,
          );
        },
      ),
    );
  }
}
