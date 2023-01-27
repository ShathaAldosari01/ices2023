import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/config/palette.dart';
import 'package:intl/intl.dart';

class UserInformation extends StatelessWidget {

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
          title: Text(documentSnapshot.get("nameWithPosition"),style: TextStyle( fontFamily: 'OpenSans'  ),),
         backgroundColor: Palette.darkBlue,
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
                  style: TextStyle(fontSize:16 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                ),
                  Text(documentSnapshot.get("nameWithPosition"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white,fontFamily: 'OpenSans',fontWeight: FontWeight.bold ),

                  ),
                  Text("Nationality",textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:10 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                  ),
                  Text(documentSnapshot.get("nationality"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),

                  ),
                  Text("Position",textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:10 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                  ),
                  Text(documentSnapshot.get("Position"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),

                  ),

                  Text("Country Of Residency",textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:10 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                  ),
                  Text(documentSnapshot.get("countryOfResidency"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),

                  ),
                  Text("Affiliation",textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:10 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                  ),
                  Text(documentSnapshot.get("affiliation"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),

                  ),
                  Text("Email",textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:10 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                  ),
                  Text(documentSnapshot.get("email"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),

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
              Text("Theme",textAlign:TextAlign.center ,
                style: TextStyle(fontSize:16 , fontStyle:FontStyle.normal ,color:Palette.darkBlue,fontFamily: 'OpenSans',fontWeight: FontWeight.bold ),
              ),
                  // Text(formattedDate(documentSnapshot.get("date")),textAlign:TextAlign.center ,
                  //
                  //   style: TextStyle(fontSize:14 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),
                  // ),
                  Text(documentSnapshot.get("theme"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize:16 , fontStyle:FontStyle.normal ,color:Palette.darkBlue ,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),
              ),
                  // Text(formattedDate(documentSnapshot.get("date")),textAlign:TextAlign.center ,
                  //   style: TextStyle(fontSize:14 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),
                  // ),
                  Text(documentSnapshot.get("title"),textAlign:TextAlign.center ,
                    style: TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white,fontFamily: 'OpenSans',fontWeight: FontWeight.bold ),
                  ),
]
              )
            ),
          ],
        )
    );

  }
}
