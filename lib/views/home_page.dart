import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> _getCurrentUser() async {
    FirebaseUser _firebaseUser;
    if (_firebaseAuth.currentUser() != null) {
      _firebaseUser = await _firebaseAuth.currentUser();
      return _firebaseUser;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: _getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Text("Loading..."),
            );
          } else {
            //print(snapshot.data);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: new Border.all(
                            color: Colors.blueAccent.shade400, width: 6.0),
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(snapshot.data.photoUrl))),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    snapshot.data.displayName,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      snapshot.data.email,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
