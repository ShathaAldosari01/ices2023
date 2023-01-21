import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:ices2023/config/palette.dart';
import 'package:ices2023/screens/home/Agenda/ListOfAgenda.dart';

class AgendaInfo extends StatelessWidget {

  final DocumentSnapshot documentSnapshot;
  AgendaInfo(this.documentSnapshot);

  @override
    Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Palette.darkBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return const ListOfAgenda();
                  }));
            },
          alignment: Alignment.centerLeft,
        ),
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

                        Container(
                          padding: const EdgeInsets.all(3.0),
                          margin: const EdgeInsets.only(top: 8.0),
                          child:
                          Text(// latter
                            'Poster session',
                            style: const TextStyle(
                              color: Palette.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),

                    //    Divider(),

                        Text(// latter
                          'Time: 11:00 PM - 11:30 PM',
                          style: TextStyle(
                            color: Palette.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'OpenSans',
                        )),

                        Text(// latter
                            'Location: Lobby',
                            style: TextStyle(
                              color: Palette.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'OpenSans',
                            )),

                        Text(// latter
                            'Session: Post 1- Poster session',
                            style: TextStyle(
                              color: Palette.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'OpenSans',
                            )),

                      ],
                    ),
                  ),

                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.red[500]),
                      Text('41'), // latter
                    ],
                  ),
                ],
              ),
            ),


            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top: 8.0),
              color: Palette.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add_circle_outline_rounded, color: Palette.white),
                      Text(
                        '  Add to My Agenda',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Palette.white,
                          fontFamily: 'OpenSans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),

          //  Divider(),

            Container(
              padding: const EdgeInsets.all(3.0),
              margin: const EdgeInsets.only(top: 20.0),
              color: Palette.lightGray,
                      child: Text(
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

            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Managamma G.',
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
              padding: const EdgeInsets.all(3.0),
              margin: const EdgeInsets.only(top: 8.0),
              color: Palette.lightGray,
              child: Text(
                'Author',
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
              padding: const EdgeInsets.all(3.0),
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Managamma G.',
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

           // Divider(),

            Container(
              padding: const EdgeInsets.all(3.0),
              margin: const EdgeInsets.only(top: 8.0),
              color: Palette.lightGray,
              child: Text(
                'Abstract',
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
              padding: const EdgeInsets.all(3.0),
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                'abstrac abstrac abstrac at abstrac foot of the abstrac in the '
                    'Bernese abstrac. Situated 1,578 abstrac above sea level, it '
                    'is one of the abstrac Alpine Lakes. A gondola ride from '
                    'Kandersteg, abstrac by a half-hour walk through pastures '
                    'and pine forest, leads you to abstrac lake, which warms to '
                    '20 degrees Celsius in the summer. Activities enjoyed here '
                    'include rowing, and riding the summer toboggan run.',
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
            ),

           // Divider(),

          ],
        ),
      );
  }
