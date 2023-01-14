import 'package:flutter/material.dart';
import 'package:ices2023/screens/auth/login.dart';
import 'package:ices2023/screens/auth/sign_in.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  //att
  bool showLogin = false;

  //function
  void toggleView(){
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  showLogin? Login(toggleView: toggleView) :SignIn(toggleView: toggleView);
  }
}

