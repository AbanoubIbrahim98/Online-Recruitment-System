// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:resume/company/view_jobs.dart';
// import 'file:///C:/flutterProjects/projects/demo-projects/resume/lib/company/home.dart';
//
// class Register extends StatefulWidget {
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   String email, password;
//   bool spinner = false;
//   var _formKey = GlobalKey<FormState>();
//   var _auth = FirebaseAuth.instance;
//   var emailValidator = MultiValidator([
//     RequiredValidator(errorText: 'email is required'),
//     EmailValidator(errorText: 'email not valid'),
//     // PatternValidator( r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$', errorText: 'email format not valid'),
//   ]);
//
//   var passwordValidator = MultiValidator([
//     RequiredValidator(errorText: 'password is required'),
//     MinLengthValidator(8, errorText: 'password at least 8 chars'),
//     PatternValidator(r'(?=.*?[#?!@$%^&*-])',
//         errorText: 'password must have special char'),
//   ]);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.purple,
//           title: Text(
//             'Register',
//             style: TextStyle(
//               fontSize: 30,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         body: Builder(
//           builder: (context) => ModalProgressHUD(
//             inAsyncCall: spinner,
//             child: ListView(
//               padding: EdgeInsets.all(20),
//               children: [
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       SizedBox(height: 40),
//                       Text(
//                         'Enter your email:',
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: Colors.purple,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 25,
//                       ),
//                       TextFormField(
//                         validator: emailValidator,
//                         //     (validate) {
//                         //   if (validate.isEmpty) {
//                         //     return 'email is required';
//                         //   } else if (!RegExp(
//                         //           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//                         //       .hasMatch(validate)) {
//                         //     return 'email format not valid';
//                         //   }
//                         //   return null;
//                         // },
//                         onChanged: (val) {
//                           email = val;
//                         },
//                         decoration: InputDecoration(
//                             hintText: 'enter email',
//                             labelText: 'email',
//                             border: OutlineInputBorder()),
//                       ),
//                       SizedBox(
//                         height: 25,
//                       ),
//                       Text(
//                         'Enter your password:',
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: Colors.purple,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 25,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         obscureText: true,
//                         validator: passwordValidator,
//
//                         //     (validate) {
//                         //   if (validate.isEmpty) {
//                         //     return 'password is required';
//                         //   } else if (validate.length < 8) {
//                         //     return 'password length at least 8 chars';
//                         //   } else if (RegExp(r'(?=.*?[#?!@$%^&*-])')
//                         //       .hasMatch(validate)) {
//                         //     return 'password must have special char';
//                         //   }
//                         //   return null;
//                         // },
//                         onChanged: (val) {
//                           password = val;
//                         },
//                         decoration: InputDecoration(
//                           hintText: 'enter password',
//                           labelText: 'password',
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                     ],
//                   ),
//                 ),
//                 FlatButton(
//                   color: Colors.purple,
//                   padding: EdgeInsets.all(20),
//                   onPressed: () async {
//                     if (_formKey.currentState.validate()) {
//                       var connectivityResult =
//                       await (Connectivity().checkConnectivity());
//                       if (connectivityResult != ConnectivityResult.mobile &&
//                           connectivityResult != ConnectivityResult.wifi) {
//                         Scaffold.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('no internet connection'),
//                             backgroundColor: Colors.red,
//                           ),
//                         );
//                       } else {
//                         try {
//                           setState(() {
//                             spinner = true;
//                           });
//                           await _auth.createUserWithEmailAndPassword(
//                               email: email, password: password);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Home(),
//                             ),
//                           );
//                           setState(() {
//                             spinner = false;
//                           });
//                         } catch (e) {
//                           setState(() {
//                             spinner = false;
//                           });
//                           if (e is FirebaseAuthException) {
//                             if (e.code == 'email-already-in-use') {
//                               Scaffold.of(context).showSnackBar(
//                                 SnackBar(
//                                   backgroundColor: Colors.red,
//                                   content: Text('email already in use'),
//                                 ),
//                               );
//                             }
//                           }
//                         }
//                       }
//                     }
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(
//                       fontSize: 25,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     'Already have account?',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
