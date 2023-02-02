import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:ices2023/config/palette.dart';
import 'package:ices2023/screens/home/Agenda/ListOfAgenda.dart';
import 'package:intl/intl.dart';

import '../people/infoUser.dart';

class AgendaInfo extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  final String col;

  AgendaInfo(this.documentSnapshot, this.col);

  //att
  bool loading = false;
  var track = [
    "Natural Sciences: Future of Energy",
    "Natural Sciences: Mining",
    "Natural Sciences: Industrial Chemistry",
    "Natural Sciences: Applied Materials",
    "Natural Sciences: Natural Resources",
    "Natural Sciences: Astronomy",
    "Life Sciences: Environment and Life Quality",
    "Life Sciences: Biotechnology",
    "Mathematical Sciences: Mathematical Structures and their Applications",
    "Mathematical Sciences: Mathematical Modeling and its Applications",
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.darkBlue,
        ),

        body: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(3.0),
              margin: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //title
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                          margin: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            // latter
                            documentSnapshot.get("title").toString(),
                            style: const TextStyle(
                              color: Palette.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),

                        //    Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            ),



            //  Divider(),


            //speaker
            documentSnapshot.get("speaker").toString()!=""?
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  margin: const EdgeInsets.only(top: 20.0),
                  color: Palette.lightGray,
                  child: const Text(
                    'Speaker',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Palette.black,
                      fontFamily: 'OpenSans',
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16),
                    child:Text(
                      documentSnapshot.get("speaker").toString(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Palette.blue,
                        fontFamily: 'OpenSans',
                      ),
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> UserInformation(documentSnapshot.get("speakerId"))));
                  },
                ),
              ],
            ):const SizedBox(),


            //time
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
              margin: const EdgeInsets.only(top: 20.0),
              color: Palette.lightGray,
              child: const Text(
                'Time',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Palette.black,
                  fontFamily: 'OpenSans',
                ),
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16),
              child:Text(
                DateFormat('hh:mm').format(documentSnapshot.get("time").toDate())+' - '+DateFormat('hh:mm').format(documentSnapshot.get("endTime").toDate()),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Palette.black,
                  fontFamily: 'OpenSans',
                ),
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
            ),


            //buildingNum
            documentSnapshot.get("buildingNum").toString()!=""?
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Building number
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  margin: const EdgeInsets.only(top: 20.0),
                  color: Palette.lightGray,
                  child:  const Text(
                  "Building number",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Palette.black,
                      fontFamily: 'OpenSans',
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16),
                  child:Text(
                    documentSnapshot.get("buildingNum").toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Palette.black,
                      fontFamily: 'OpenSans',
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),

                //roomNum
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  margin: const EdgeInsets.only(top: 20.0),
                  color: Palette.lightGray,
                  child:  const Text(
                    "Room number",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Palette.black,
                      fontFamily: 'OpenSans',
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16),
                  child:Text(
                    documentSnapshot.get("roomNum").toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Palette.black,
                      fontFamily: 'OpenSans',
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),

              ],
            ):

            //location
            documentSnapshot.get("location").toString()!=""?
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding:const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  margin: const EdgeInsets.only(top: 20.0),
                  color: Palette.lightGray,
                  child:  const Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Palette.black,
                      fontFamily: 'OpenSans',
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16),
                  child:Text(
                    documentSnapshot.get("location").toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Palette.black,
                      fontFamily: 'OpenSans',
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ):const SizedBox(),


            //track
            documentSnapshot.get("track").toString()=="1" ||
                documentSnapshot.get("track").toString()=="2"||
                documentSnapshot.get("track").toString()=="3" ||
                documentSnapshot.get("track").toString()=="4"||
                documentSnapshot.get("track").toString()=="5" ||
                documentSnapshot.get("track").toString()=="6"||
                documentSnapshot.get("track").toString()=="7" ||
                documentSnapshot.get("track").toString()=="8"||
                documentSnapshot.get("track").toString()=="9"||
                documentSnapshot.get("track").toString()=="10" ||
                documentSnapshot.get("track").toString()=="11"?

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  margin: const EdgeInsets.only(top: 20.0),
                  color: Palette.lightGray,
                  child: const Text(
                    'Track',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Palette.black,
                      fontFamily: 'OpenSans',
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16),
                  child:Text(
                    track[int.parse(documentSnapshot.get("track").toString())-1],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Palette.black,
                      fontFamily: 'OpenSans',
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ):
            const SizedBox(),


            // Divider(),
          ],
        ),
      );
}
