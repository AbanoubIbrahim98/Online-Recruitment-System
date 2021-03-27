import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:resume/auth/Screens/Login/components/background.dart';
import 'package:resume/auth/Screens/Login/login_screen.dart';
import 'package:resume/auth/Screens/Signup/components/or_divider.dart';
import 'package:resume/auth/Screens/Signup/components/social_icon.dart';
import 'package:resume/auth/components/already_have_an_account_acheck.dart';
import 'package:resume/auth/components/rounded_button.dart';
import 'package:resume/auth/components/rounded_input_field.dart';
import 'package:resume/auth/components/rounded_password_field.dart';
import 'package:resume/company/screens/home.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email, password;
  bool spinner =false;
  var _formKey = GlobalKey<FormState>();
  var _auth = FirebaseAuth.instance;
  var _emailController=TextEditingController();
  var _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    "SIGNUP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/signup.svg",
                    height: size.height * 0.35,
                  ),
                  RoundedInputField(
                    controller:_emailController,
                    hintText: "Your Email",
                    onChanged: (value) {email=value;},
                  ),
                  RoundedPasswordField(
                    controller: _passwordController,
                    onChanged: (value) {password=value;},
                  ),
                  RoundedButton(
                    text: "SIGNUP",
                    press: () async{
                      if (_formKey.currentState.validate()) {
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
                              spinner = true;
                            });
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                            setState(() {
                              spinner = false;
                            });
                          } catch (e) {
                            setState(() {
                              spinner = false;
                            });
                            if (e is FirebaseAuthException) {
                              if (e.code == 'email-already-in-use') {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('email already in use'),
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
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocalIcon(
                        iconSrc: "assets/icons/facebook.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/google-plus.svg",
                        press: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
