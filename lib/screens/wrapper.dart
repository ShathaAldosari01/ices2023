import 'package:flutter/material.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //user auht => return Home, user NOT auth => return Auth
    return Home();
  }
}
