import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/screens/home/people/person.dart';
import 'package:ices2023/config/palette.dart';
import 'package:intl/intl.dart';

class UserInformation extends StatelessWidget {
  // UserInformation(DocumentSnapshot<Object?> documentSnapshot);
  String formattedDate(timeStamp){
    var dateFromTimeStamp=DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds *1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
  }
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
              color: Palette.yellow,
              child:Column(

                children:[
                  Text("Person Information",textAlign:TextAlign.center ,
                  style: TextStyle(fontSize:36 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                ),
                  Text(documentSnapshot.get("name"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:19 , fontStyle:FontStyle.normal , color:Colors.white,fontFamily: 'OpenSans' ),

                  ),
                  Text(documentSnapshot.get("organization"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:19 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans'),

                  ),


          ],

              )


            ),
            Container(
              width: 100,
              height:200,
                color: Palette.green,
              child:Column(

                children:[
              Text("Paper Name",textAlign:TextAlign.center ,
                style: TextStyle(fontSize:36 , fontStyle:FontStyle.normal ,color:Palette.darkBlue,fontFamily: 'OpenSans',fontWeight: FontWeight.bold ),
              ),
                  Text(formattedDate(documentSnapshot.get("date")),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:19 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans'),
                  ),
                  Text(documentSnapshot.get("paperName "),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:19 , fontStyle:FontStyle.normal , color:Colors.white,fontFamily: 'OpenSans' ),
                  ),
              ]
            )
            ),
            Container(
              width: 100,
              height:200,
                color: Palette.blue,
              child:Column(

                children:[
              Text("Presentation Subject",textAlign:TextAlign.center ,
                style: TextStyle(fontSize:36 , fontStyle:FontStyle.normal ,color:Palette.darkBlue ,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),
              ),
                  Text(formattedDate(documentSnapshot.get("date")),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:19 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans'),
                  ),
                  Text(documentSnapshot.get("PresentationName"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:19 , fontStyle:FontStyle.normal , color:Colors.white,fontFamily: 'OpenSans' ),
                  ),
]
              )
            ),
          ],
        )
    );

  }
}
