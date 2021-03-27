import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/onboarding/onboarding_page.dart';

import 'user/model/provider_class.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    //provider to listen to data
    ChangeNotifierProvider<GetListView>(
      create: (context) => GetListView(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //builder to control directionality
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: child,
          );
        },
        home: Onboarding1(),
        // home: AddQuestions(),
      ),
    ),
  );
}
