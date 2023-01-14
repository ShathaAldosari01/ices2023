import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/screens/home/people/person.dart';
import 'package:ices2023/config/palette.dart';

class ListOfPeople extends StatelessWidget {

  Widget builUser(Person user) => ListTile(
    leading:CircleAvatar(
        backgroundColor: Palette.yellow) ,
    title:Text(user.name),
    subtitle:Text(user.position) ,
    trailing:Icon(Icons.arrow_forward_ios_rounded),
  );


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('People'),
    ),
    body:StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('user1')
          .snapshots(),
       builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData ){
          final users =snapshot.data!;
         return ListView.builder(itemCount :snapshot.data!.docs.length,itemBuilder:(context,index) {
           DocumentSnapshot documentSnapshot =snapshot.data!.docs[index];
           return Card(
               child:ListTile(
                 title: Text(documentSnapshot.get("name")),
                 subtitle:Text(documentSnapshot.get("position")) ,
                 leading:CircleAvatar(
                     backgroundColor: Colors.amberAccent[100]) ,
                 trailing:Icon(Icons.arrow_forward_ios_rounded),
           )
           );
         },

         );}
        else{
          return Center(
              child:Text("please agin"),
          );
        }

      }),
    );



}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('People'),
      ),
    );
  }



