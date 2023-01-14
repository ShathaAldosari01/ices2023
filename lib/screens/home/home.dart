import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  //att
  final FirebaseAuth _auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
        elevation: 0.0,
        actions: [
          InkWell(
            child: Text("log out"),
            onTap: ()async{
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
