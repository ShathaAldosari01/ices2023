import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ices2023/config/palette.dart';

class ListOfAgenda extends StatefulWidget {
  const ListOfAgenda({Key? key}) : super(key: key);

  @override
  State<ListOfAgenda> createState() => _ListOfAgendaState();
}

class _ListOfAgendaState extends State<ListOfAgenda> {

  //attribute
  String dropDownValue = 'T1-FOE:  Natural Sciences: Future of Energy';

  // List of items in our dropdown menu
  var items = [
    'T1-FOE:  Natural Sciences: Future of Energy',
    'T2-MIN: Natural Sciences: Mining',
    'T3-Ich: Natural Sciences: Industrial Chemistry',
    'T4-AMs: Natural Sciences: Applied Materials',
    'T5-NRs: Natural Sciences: Natural Resources',
    'T6-Ast: Natural Sciences: Astronomy',
    'T7-ELQ: Life Sciences: Environment and Life Quality',
    'T8-Bio: Life Sciences: Biotechnology',
    'T9-MSA: Mathematical Sciences: Mathematical Structures and their Applications',
    'T10-MMA: Mathematical Sciences: Mathematical Modeling and its Applications'
  ];

  //which day
  var day = [true, false, false];

  // still design
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        title: const Text(
          'Agenda',
          style: TextStyle(
            color: Palette.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      body: Column(children: [

        const SizedBox(
          height: 15,
        ),

        //days
        Row(
          children: [

            const SizedBox(width: 5,),
            //day 1
            InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical:5),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: day[0]?Palette.yellow:Colors.grey[200],
                ),
                child: Column(
                  children: const [

                    Text(
                        "FEB",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        )
                    ),

                    SizedBox(height: 5,),

                    Text(
                        "6",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                        )
                    ),

                    SizedBox(height: 5,),

                    Text(
                        "MON",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        )
                    )
                  ],
                ),
              ),
              //action
              onTap: (){
                setState(() {
                  day[0]= true;
                  day[1]= false;
                  day[2] = false;
                });
              },
            ),

            //day 2
            InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical:5),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: day[1]?Palette.blue:Colors.grey[200],
                ),
                child: Column(
                  children: const [

                    Text(
                        "FEB",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        )
                    ),

                    SizedBox(height: 5,),

                    Text(
                        "7",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                        )
                    ),

                    SizedBox(height: 5,),

                    Text(
                        "TUE",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        )
                    )
                  ],
                ),
              ),
              //action
              onTap: (){
                setState(() {
                  day[0]= false;
                  day[1]= true;
                  day[2] = false;
                });
              },
            ),

            //day 3
            InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical:5),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: day[2]?Palette.green:Colors.grey[200],
                ),
                child: Column(
                  children: const [

                    Text(
                        "FEB",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        )
                    ),

                    SizedBox(height: 5,),

                    Text(
                        "8",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                        )
                    ),

                    SizedBox(height: 5,),

                    Text(
                        "WED",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                        )
                    )
                  ],
                ),
              ),
              //action
              onTap: (){
                setState(() {
                  day[0]= false;
                  day[1]= false;
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
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
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


        //agenda
        Expanded(
          child: StreamBuilder(
            //  >> Agenda List, it is working but with the DatePicker not, I'll add a tab as date instaed of DatePicker.

              stream:
              FirebaseFirestore.instance.collection('agendas').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final agendas = snapshot.data!;
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                      return Card(
                          child: ListTile(
                            tileColor: Colors.white,

                            title: Text(
                              documentSnapshot.get("title"),
                              style: const TextStyle(
                                color: Palette.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),

                            subtitle: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.person),
                                Text(
                                  documentSnapshot.get("Persone"),
                                  style: const TextStyle(
                                    color: Palette.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                                const Icon(Icons.location_on_outlined),
                                Text(
                                  documentSnapshot.get("Location"),
                                  style: const TextStyle(
                                    color: Palette.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ],
                            ),

                            leading: Column(
                              children: [
                                Text(
                                  documentSnapshot.get("startTime"),
                                  style: const TextStyle(
                                    color: Palette.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                                const Text(" - "),
                                Text(
                                  documentSnapshot.get("endTime"),
                                  style: const TextStyle(
                                    color: Palette.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ],
                            ),

                            /* leading: ClipRRect(         << OR This leading but need to design
                           borderRadius: BorderRadius.circular(5.0),
                           child: Container(
                             height: 60.0,
                             width: 60.0,
                             color: Palette.green,
                            child: Text(
                              documentSnapshot.get("startTime")
                            +"\n"+"\n"+
                                  documentSnapshot.get("startTime"),),
                             ),
                           ),
                           */

                            trailing: const Icon(Icons.arrow_forward_ios_rounded),
                            // if zoom we add video icon
                            onTap: () {
                              //Navigator.push(context,MaterialPageRoute(builder: (context)=> postInformation(documentSnapshot)));
                            },
                          ));
                    },
                  );
                } else {
                  return const Center(
                    child: Text("please agin"),
                  );
                }
              }),
        ),
      ]));
}

/*
*  AFTER >> If we want the user to select topic then showing agenda list
  void retrieveDocUsingConditionTopic1(){
    firestoreInstance.collection("agendas").where("topic", isEqualTo: 1)
        .get().then((value) => {
          value.docs.forEach((element) {

          //  print(element.id);
          // print(element.data());
          })
    });
  }
  *
  *  void retrieveDocUsingConditionTopic2(){
    firestoreInstance.collection("agendas").where("topic", isEqualTo: 2)
        .get().then((value) => {
          value.docs.forEach((element) {

           //  print(element.id);
          // print(element.data());
          })
    });
  }
  *
  *
  *  void retrieveDocUsingConditionTopic3(){
    firestoreInstance.collection("agendas").where("topic", isEqualTo: 3)
        .get().then((value) => {
          value.docs.forEach((element) {

          //  print(element.id);
          // print(element.data());
          })
    });
  }
*
* */