import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/user/model/provider_class.dart';
import 'package:resume/user/screens/chat_page_new.dart';
import 'package:resume/user/widgets/chat_widgets.dart';


var myTextStyle = TextStyle(
  color: Colors.blue,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

//-----------------------------------------------------
class JobFullDetails extends StatefulWidget {
  JobFullDetails(
      {this.jobTitle, this.companyName, this.jobReq, this.companyDesc,this.companyMail});

  final String jobTitle, companyName, companyDesc, jobReq,companyMail;

  @override
  _JobFullDetailsState createState() => _JobFullDetailsState();
}

class _JobFullDetailsState extends State<JobFullDetails> {
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<GetListView>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Job Details",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xff0DA2A6),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Text(
            'Company name:',
            style: myTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(widget.companyName),
            ),
          ),
          SizedBox(height: 15),
          //----------------------------------------------------
          Text(
            'Company Description:',
            style: myTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(widget.companyDesc),
            ),
          ),
          SizedBox(height: 15),
          //----------------------------------------------------
          Text(
            'Job Title:',
            style: myTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(widget.jobTitle),
            ),
          ),
          SizedBox(height: 15),
          //----------------------------------------------------
          Text(
            'Job Requirements:',
            style: myTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(widget.jobReq),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //----------------------------------------------------
          FlatButton(
            padding: EdgeInsets.all(15),
            color: Colors.teal,
            onPressed: () {
              myProvider.getJobTitle(widget.jobTitle);
              myProvider.myListView.addAll([
                hiMessage(),
                whatAboutQuestion("Please, enter full name:",),
                showTextFieldName(widget.companyMail)
              ]);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPageNew(),
                ),
              );
            },
            child: Text(
              'Apply for Job',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
