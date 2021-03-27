import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:resume/company/screens/applications.dart';
import 'package:resume/company/screens/post_job.dart';

var myTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.teal,
  fontWeight: FontWeight.bold,
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String loggedUser;

  @override
  void initState() {
    var _auth = FirebaseAuth.instance;
    loggedUser = _auth.currentUser.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 100,
              color: Colors.pink,
              width: double.infinity,
              child: Center(
                child: Text(
                  loggedUser,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ListTile(
              title: Text(
                'Home',
                style: myTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Job Opening',
                style: myTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Candidates',
                style: myTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Interviews',
                style: myTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Departments',
                style: myTextStyle,
              ),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff0DA2A6),
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              width: double.infinity,
              child: FlatButton(
                padding: EdgeInsets.all(25),
                color: Color(0xff0DA2A6),
                child: Text(
                  'Post Job',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostJob(),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              width: double.infinity,
              child: FlatButton(
                padding: EdgeInsets.all(25),
                color: Color(0xff0DA2A6),
                child: Text(
                  'Applications',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Applications(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
