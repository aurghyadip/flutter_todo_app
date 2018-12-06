import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.green,
        ),
        Center(
          child: FlatButton(
            onPressed: () {
              _firebaseAuth.signOut();
            },
            child: Text("Logout"),
            textColor: Colors.white,
            color: Colors.black,
          )
        )
      ],
    );
  }
}