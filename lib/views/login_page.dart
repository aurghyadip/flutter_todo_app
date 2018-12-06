import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final _loginForm = GlobalKey<FormState>();
  
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication gAuth = await googleUser.authentication;

    FirebaseUser user = await _fAuth.signInWithGoogle(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return user;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: new Stack(
        children: <Widget>[
          new Container(
            color: Colors.lightBlue.shade50,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child: new FlutterLogo(size: 125.0),
              ),
              SizedBox(height: 10.0),
              Text(
                "Flutter TODO App",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Form(
                key: _loginForm,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if(value.isEmpty) {
                            return "Please enter an email";
                          }
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email, color: Colors.black),
                          hintText: "Enter your email",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        validator: (value) {
                          if(value.isEmpty) {
                            return "Please enter a password";
                          }
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock, color: Colors.black),
                          hintText: "Enter Password",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                        obscureText: true,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                        child: FlatButton(
                          onPressed: () {
                            if(_loginForm.currentState.validate()) {
                              Fluttertoast.showToast(
                                msg: "Yayeee!! You did it.",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                bgcolor: '#228B22',
                                textcolor: '#ffffff'
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: "Some errors in form",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                textcolor: '#ffffff',
                                bgcolor: '#ff0000'
                              );
                            }
                          },
                          child: Text(
                            "Login with Email",
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                          color: Colors.lightBlueAccent.shade700,
                          splashColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: FlatButton(
                          onPressed: () {
                            _handleSignIn().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e));
                          },
                          child: Text(
                            "Login with Google",
                            style: TextStyle(fontSize: 19.0, color: Colors.white),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                          color: Colors.red.shade400,
                          splashColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}