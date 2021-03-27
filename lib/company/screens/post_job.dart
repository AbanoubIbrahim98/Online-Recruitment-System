import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

var myTextStyle = TextStyle(
  color: Colors.blue,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
var requiredValidator = MultiValidator([
  RequiredValidator(errorText: 'field is required'),
]);

//-------------------------------------------------------------------
class PostJob extends StatefulWidget {
  @override
  _PostJobState createState() => _PostJobState();
}

class _PostJobState extends State<PostJob> {
  var _fireStore = FirebaseFirestore.instance;
  var _formKey = GlobalKey<FormState>();
  String companyName, companyDesc, jobTitle, jobReq;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Post Job",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Color(0xff0DA2A6),
        ),
        body: Builder(
          builder: (context) => ModalProgressHUD(
            inAsyncCall: spinner,
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Text(
                    'Enter company name:',
                    style: myTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: requiredValidator,
                    onChanged: (val) {
                      companyName = val;
                    },
                    decoration: InputDecoration(
                        hintText: 'enter company name ..',
                        labelText: 'company name',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Enter company description:',
                    style: myTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: requiredValidator,
                    maxLines: 4,
                    onChanged: (val) {
                      companyDesc = val;
                    },
                    decoration: InputDecoration(
                        hintText: 'enter company description ..',
                        labelText: 'company description',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Enter job title:',
                    style: myTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: requiredValidator,
                    onChanged: (val) {
                      jobTitle = val;
                    },
                    decoration: InputDecoration(
                        hintText: 'enter job title ..',
                        labelText: 'job title',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Enter job requirements:',
                    style: myTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: requiredValidator,
                    maxLines: 4,
                    onChanged: (val) {
                      jobReq = val;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter job requirements ..',
                        labelText: 'job requirements',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.teal,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        //used to check connectivity
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult != ConnectivityResult.mobile &&
                            connectivityResult != ConnectivityResult.wifi) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('no internet connection'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          setState(() {
                            spinner=true;
                          });
                          //used to get logged user
                          var _auth = FirebaseAuth.instance;
                          String loggedUser = _auth.currentUser.email;

                          //used to post data
                          await _fireStore.collection('postJob').add({
                            'companyName': companyName,
                            'companyMail':loggedUser,
                            'companyDesc': companyDesc,
                            'jobTitle': jobTitle,
                            'jobReq': jobReq,
                            'sort': DateTime.now().millisecondsSinceEpoch
                          });
                          Navigator.pop(context);
                          setState(() {
                            spinner=false;
                          });
                        }
                      }
                    },
                    child: Text(
                      'submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
