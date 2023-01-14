import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import 'auth/auth.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //att
    final user = Provider.of<Users?>(context);

    //user auht => return Home, user NOT auth => return Auth
    return user == null? Auth(): Home();
  }
}
