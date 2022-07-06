import 'package:mfieldtrip/Login.dart';
import 'package:mfieldtrip/Signup.dart';
import 'package:mfieldtrip/Start.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(

      theme: ThemeData(
          primaryColor: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),

      routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Start(),
      },

    );
  }

}
