import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'views/home_page.dart';
import 'views/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _handleCurrentScreen(),
    );
  }


  Widget _handleCurrentScreen() {
    return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return new Container(
            color: Colors.green,
          );
        } else {
          if(snapshot.hasData) {
            return new HomePage();
          }
          return new LoginPage();
        }
      },
    );    
  }
}

