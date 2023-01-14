import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/screens/home/people/person.dart';
import 'package:ices2023/config/palette.dart';

class UserInformation extends StatelessWidget {
  // UserInformation(DocumentSnapshot<Object?> documentSnapshot);

  final DocumentSnapshot documentSnapshot;
  UserInformation(this.documentSnapshot);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(documentSnapshot.get("name")),
        ),
        body: Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              height:200,
              child:Text("Person Information",textAlign:TextAlign.center ,
                style: TextStyle(fontSize:36 , fontStyle:FontStyle.normal , color:Colors.white ),
              ),
              color: Palette.yellow,
            ),
            Container(
              width: 100,
              height:200,
              child:Text("Paper Name",textAlign:TextAlign.center ,
                style: TextStyle(fontSize:36 , fontStyle:FontStyle.normal ,color:Colors.white ),
              ),
              color: Palette.green,

            ),
            Container(
              width: 100,
              height:200,
              child:Text("Presentation Subject",textAlign:TextAlign.center ,
                style: TextStyle(fontSize:36 , fontStyle:FontStyle.normal ,color:Colors.white  ),
              ),
              color: Palette.blue,

            ),
          ],
        )
    );

  }
}
