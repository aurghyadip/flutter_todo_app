import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: new Stack(
        children: <Widget>[
          new Container(
            color: Colors.yellowAccent.shade100,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email, color: Colors.black),
                          hintText: "Enter your email",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock, color: Colors.black),
                          hintText: "Enter Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                        obscureText: true,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                        child: RaisedButton(
                          onPressed: () {
                            Fluttertoast.showToast(
                              msg: "Yayeee!! You did it.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              bgcolor: "#e74c3c",
                              textcolor: '#ffffff'
                            );
                          },
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(fontSize: 20.0, color: Colors.white)
                          ),
                          padding: EdgeInsets.all(15.0),
                          color: Colors.black,
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