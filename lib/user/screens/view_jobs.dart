import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resume/company/widgets/view_job_card.dart';
import 'package:resume/user/screens/job_full_datails.dart';

class ViewJobs extends StatefulWidget {
  @override
  _ViewJobsState createState() => _ViewJobsState();
}

class _ViewJobsState extends State<ViewJobs> {
  var _fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "View Jobs",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xff0DA2A6),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('postJob').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var snap = snapshot.data.docs;
          List<ViewJobCard> cardList = [];
          for (var item in snap) {
            String companyName = item.data()['companyName'];
            String companyMail = item.data()['companyMail'];
            String companyDesc = item.data()['companyDesc'];
            String jobTitle = item.data()['jobTitle'];
            String jobReq = item.data()['jobReq'];

            var itemCard = ViewJobCard(
              companyName: companyName,
              jobTitle: jobTitle,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobFullDetails(
                      companyMail: companyMail,
                      jobTitle: jobTitle,
                      jobReq: jobReq,
                      companyName: companyName,
                      companyDesc: companyDesc,
                    ),
                  ),
                );
              },
            );
            cardList.add(itemCard);
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
