import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:ices2023/config/palette.dart';
import 'package:ices2023/screens/home/Agenda/ListOfAgenda.dart';
import 'package:ices2023/shared/loading.dart';
import 'package:intl/intl.dart';

import '../people/infoUser.dart';

class AgendaInfo extends StatefulWidget {
  final String agendaId;
  final String col;

  AgendaInfo(this.agendaId, this.col);

  @override
  State<AgendaInfo> createState() => _AgendaInfoState();
}

class _AgendaInfoState extends State<AgendaInfo> {
  @override
  void initState() {
    getAgenda();
    super.initState();
  }
  //att
  bool loading = false;
  var agendaData = {};

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

  getAgenda() async {
    try {
      if (widget.agendaId != null) {
        var userSnap = await FirebaseFirestore.instance
            .collection('MON')
            .doc(widget.agendaId)
            .get();

        setState(() {
          agendaData = userSnap.data()!;
          loading = true;
        });
      }
    } catch (e) {
        try {
          if (widget.agendaId != null) {
            var userSnap = await FirebaseFirestore.instance
                .collection('TUE')
                .doc(widget.agendaId)
                .get();

            setState(() {
              agendaData = userSnap.data()!;
              loading = true;
            });
          }
        } catch (e) {
          try {
            if (widget.agendaId != null) {
              var userSnap = await FirebaseFirestore.instance
                  .collection('WED')
                  .doc(widget.agendaId)
                  .get();

              setState(() {
                agendaData = userSnap.data()!;
                loading = true;
              });
            }
          } catch (e) {
            print(e.toString());
          }
          print(e.toString());
        }
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) =>!loading?const Loading(): Scaffold(
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
                          agendaData["title"].toString(),
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
        agendaData["speaker"].toString()!=""?
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
                  fontWeight: FontWeight.normal,
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
                  agendaData["speaker"].toString(),
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
                Navigator.push(context,MaterialPageRoute(builder: (context)=> UserInformation(agendaData["speakerId"])));
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
              fontWeight: FontWeight.normal,
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
            DateFormat('hh:mm').format(agendaData["time"].toDate())+' - '+DateFormat('hh:mm').format(agendaData["endTime"].toDate()),
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
        agendaData["buildingNum"].toString()!=""?
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
                  fontWeight: FontWeight.normal,
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
                agendaData["buildingNum"].toString(),
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
                  fontWeight: FontWeight.normal,
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
                agendaData["roomNum"].toString(),
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
        agendaData["location"].toString()!=""?
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
                  fontWeight: FontWeight.normal,
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
                agendaData["location"].toString(),
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
            agendaData["track"].toString()=="1" ||
            agendaData["track"].toString()=="2"||
                agendaData["track"].toString()=="3" ||
                agendaData["track"].toString()=="4"||
                agendaData["track"].toString()=="5" ||
                agendaData["track"].toString()=="6"||
                agendaData["track"].toString()=="7" ||
                agendaData["track"].toString()=="8"||
                agendaData["track"].toString()=="9"||
                agendaData["track"].toString()=="10" ||
                agendaData["track"].toString()=="11"?

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
                  fontWeight: FontWeight.normal,
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
                track[int.parse(agendaData["track"].toString())-1],
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
