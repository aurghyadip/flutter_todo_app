import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final _loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: new Stack(
        children: <Widget>[
          new Container(
            color: Colors.lime.shade300,
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
                            "SUBMIT",
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          padding: EdgeInsets.all(15.0),
                          color: Colors.black,
                          splashColor: Colors.redAccent,
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