import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ices2023/config/palette.dart';
import 'package:ices2023/screens/home/Agenda/moreInfo.dart';
import 'package:intl/intl.dart';

import '../navbar/navbar.dart';

class ListOfAgenda extends StatefulWidget {
  const ListOfAgenda({Key? key}) : super(key: key);

  @override
  State<ListOfAgenda> createState() => _ListOfAgendaState();
}

class _ListOfAgendaState extends State<ListOfAgenda> {
  //attribute
  String dropDownValue = '1';

  // List of items in our dropdown menu
  var items = [
    //t1
    RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
            fontFamily: 'OpenSans'
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'T1-FOE:  ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
          TextSpan(
              text: 'Natural Sciences: Future of Energy',
              style: TextStyle(
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    ),

    //t2
    RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
            fontFamily: 'OpenSans'
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'T2-MIN: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
          TextSpan(
              text: 'Natural Sciences: Mining',
              style: TextStyle(
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    ),

    //t3
    RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
            fontFamily: 'OpenSans'
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'T3-Ich: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
          TextSpan(
              text: 'Natural Sciences: Industrial Chemistry',
              style: TextStyle(
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    ),

    //t4
    RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
            fontFamily: 'OpenSans'
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'T4-AMs: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
          TextSpan(
              text: 'Natural Sciences: Applied Materials',
              style: TextStyle(
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    ),

    //5
    RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
            fontFamily: 'OpenSans'
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'T5-NRs: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
          TextSpan(
              text: 'Natural Sciences: Natural Resources',
              style: TextStyle(
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    ),

    //6
    RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
            fontFamily: 'OpenSans'
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'T6-Ast: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
          TextSpan(
              text: 'Natural Sciences: Astronomy',
              style: TextStyle(
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    ),

    //7
    RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
            fontFamily: 'OpenSans'
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'T7-ELQ: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
          TextSpan(
              text: 'Life Sciences: Environment and Life Quality',
              style: TextStyle(
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    ),

    //8
    RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
            fontFamily: 'OpenSans'
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'T8-Bio: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
          TextSpan(
              text: 'Life Sciences: Biotechnology',
              style: TextStyle(
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    ),

    //9
    RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
            fontFamily: 'OpenSans'
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'T9-MSA: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
          TextSpan(
              text:
                  'Mathematical Sciences: Mathematical Structures and their Applications',
              style: TextStyle(
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    ),

    //10
    RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
            fontFamily: 'OpenSans'
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'T10-MMA: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
          TextSpan(
              text:
                  'Mathematical Sciences: Mathematical Modeling and its Applications',
              style: TextStyle(
                color: Palette.black,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    ),
  ];

  var itemsNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  var itemsString = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

  //which day
  var day = [true, false, false];

  // still design
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: Navbar(),

      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text(
          'Agenda',
          style: TextStyle(
              fontFamily: 'OpenSans'
          ),
        ),
        backgroundColor: Palette.darkBlue,
      ),

      body: Column(
          children: [
        const SizedBox(
          height: 15,
        ),

        //days
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            //day 1
            InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: day[0] ? Palette.yellow : Colors.grey[200],
                ),
                child: Column(
                  children: const [
                    Text("FEB",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("6",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("MON",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        ))
                  ],
                ),
              ),
              //action
              onTap: () {
                setState(() {
                  day[0] = true;
                  day[1] = false;
                  day[2] = false;
                });
              },
            ),

            //day 2
            InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: day[1] ? Palette.blue : Colors.grey[200],
                ),
                child: Column(
                  children: const [
                    Text("FEB",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("7",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("TUE",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        ))
                  ],
                ),
              ),
              //action
              onTap: () {
                setState(() {
                  day[0] = false;
                  day[1] = true;
                  day[2] = false;
                });
              },
            ),

            //day 3
            InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: day[2] ? Palette.green : Colors.grey[200],
                ),
                child: Column(
                  children: const [
                    Text("FEB",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("8",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("WED",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        ))
                  ],
                ),
              ),
              //action
              onTap: () {
                setState(() {
                  day[0] = false;
                  day[1] = false;
                  day[2] = true;
                });
              },
            ),
          ],
        ),

        const SizedBox(
          height: 5,
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          height: 65,
          child: Row(
            children: [
              //track
              Expanded(
                child: DropdownButton(
                  iconEnabledColor: Palette.blue,
                  hint: const Text("Choice a track that you are interested in"),
                  style: const TextStyle(
                    color: Palette.black,
                    fontFamily: 'OpenSans',
                  ),
                  isExpanded: true,
                  // Initial Value
                  value: dropDownValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: itemsNumbers.map((int i) {
                    return DropdownMenuItem(
                      value: itemsString[i],
                      child: items[i],
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),

        //agenda -
        Expanded(
          child: StreamBuilder(
              stream:
              day[0]?
              FirebaseFirestore.instance.collection('agenda').orderBy('time').snapshots():
              day[1]?
              FirebaseFirestore.instance.collection('day2').orderBy('time').snapshots():
              FirebaseFirestore.instance.collection('day3').orderBy('time').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final agendas = snapshot.data!;
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];

                      return documentSnapshot.get("track")=="all"||
                          documentSnapshot.get("track") =="break"||
                          documentSnapshot.get("track") ==dropDownValue? Card(
                        child: ListTile(
                          tileColor: documentSnapshot.get("title").toString() ==
                                  ("Break")
                              ? Colors.grey[200]
                              : Palette.white,

                          title: documentSnapshot.get("title").toString() ==
                                  ("Break")
                              ? Center(
                                  child: Text(documentSnapshot.get("title"),
                                      style: const TextStyle(
                                        color: Palette.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                      )))
                              : Text(
                                  documentSnapshot.get("title"),
                                  style: const TextStyle(
                                    color: Palette.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),

                          subtitle:  documentSnapshot.get("track")=="all"||
                              documentSnapshot.get("track") =="break"
                              ? const SizedBox()
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.person),
                                    Text(
                                      documentSnapshot.get("speakerType"),
                                      style: const TextStyle(
                                        color: Palette.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                    const Icon(Icons.location_on_outlined),
                                    Text(
                                      documentSnapshot.get("location"),
                                      style: const TextStyle(
                                        color: Palette.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ],
                                ),

                          //time
                          leading:
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical:1),
                              decoration: BoxDecoration(
                                color:documentSnapshot.get("track")=="break"?Palette.green:Palette.lightGray,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                    children: [
                                      Text(
                                       DateFormat('hh:mm').format(documentSnapshot.get("time").toDate()),
                                        style: const TextStyle(
                                          color: Palette.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          DateFormat('hh:mm').format(documentSnapshot.get("endTime").toDate()),
                                        style: const TextStyle(
                                          color: Palette.black,
                                          fontSize: 15,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ],
                                  ),
                            ),

                          trailing:  documentSnapshot.get("track")=="all"||
                              documentSnapshot.get("track") =="break"
                              ? const SizedBox()
                              : const Icon(Icons.arrow_forward_ios_rounded),
                          // if zoom we add video icon
                          onTap: () {
                            String col = day[0]?"agenda":day[1]? "day2":day[2]? "day3":"";
                            if( documentSnapshot.get("track")!="all"&&
                                documentSnapshot.get("track") !="break") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AgendaInfo(documentSnapshot, col)));
                            }
                          },
                        ),
                      ):const SizedBox();
                    },
                  );
                } else {
                  return const Center(
                    child: Text(
                        "please again",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                      ),
                    ),
                  );
                }
              }),
        ),
      ]));
}
