import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:resume/auth/Screens/Login/components/background.dart';
import 'package:resume/auth/Screens/Signup/signup_screen.dart';
import 'package:resume/auth/components/already_have_an_account_acheck.dart';
import 'package:resume/auth/components/rounded_button.dart';
import 'package:resume/auth/components/rounded_input_field.dart';
import 'package:resume/auth/components/rounded_password_field.dart';
import 'package:resume/company/screens/home.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email, password;
  bool spinner =false;
  var _formKey = GlobalKey<FormState>();
  var _auth = FirebaseAuth.instance;
  // to control text fields:
  var _emailController=TextEditingController();
  var _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //to show spinner:
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Background(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    controller: _emailController,
                    hintText: "Your Email",
                    onChanged: (value) {
                      email=value;
                    },
                  ),
                  RoundedPasswordField(
                    controller: _passwordController,
                    onChanged: (value) {
                      password=value;
                    },
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () async{
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
                          try {
                            setState(() {
                              spinner=true;
                            });
                            //used to log in
                            await _auth.signInWithEmailAndPassword(
                                email: email.trim(), password: password);
                            // used to navigate
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                            _emailController.clear();
                            _passwordController.clear();
                            setState(() {
                              spinner=false;
                            });
                          } catch (e) {
                            setState(() {
                              spinner=false;
                            });
                            if (e is FirebaseAuthException) {
                              if (e.code == 'user-not-found') {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.black,
                                    content: Text('email not found'),
                                  ),
                                );
                              }else if(e.code=='wrong-password'){
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.black,
                                    content: Text('wrong password'),
                                  ),
                                );
                              }
                            }
                          }
                        }
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
