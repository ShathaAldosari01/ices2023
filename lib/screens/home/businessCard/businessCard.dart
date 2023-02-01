import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/models/user.dart';
import 'package:ices2023/services/database.dart';
import 'package:provider/provider.dart';
import 'package:ices2023/screens/home/businessCard/user_list.dart';

class businessCard extends StatefulWidget {
  const businessCard({Key? key}) : super(key: key);

  @override
  State<businessCard> createState() => _businessCardState();
}

class _businessCardState extends State<businessCard> {
  //att
  final uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Users>>.value(
      value: DatabaseService(uid: uid??"").users,
        // create: create,
        initialData: [],
        child:const Scaffold(body: UserList()),
    );
  }
}
