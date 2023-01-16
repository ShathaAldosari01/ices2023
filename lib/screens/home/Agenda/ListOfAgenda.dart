import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ices2023/config/palette.dart';

class ListOfAgenda extends StatelessWidget {
  const ListOfAgenda({Key? key}) : super(key: key);

  // still design

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      backgroundColor: Palette.white,
      title: Text('Agenda',
        style: TextStyle(
          color: Palette.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),

    ),

    body:

    Column(
        children: [

    Container(
    margin: const EdgeInsets.only(top:20, left:20),
    child: DatePicker(
    DateTime.now(),
    height:100,
    width:80,
    initialSelectedDate:DateTime.now(),
    selectionColor: Colors.green,
    selectedTextColor: Colors.white,
    dateTextStyle: TextStyle(
      color: Palette.grey,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    ),
  ),
  ),

/*
   StreamBuilder(    >> Agenda List, it is working but with the DatePicker not, I'll add a tab as date instaed of DatePicker.

        stream: FirebaseFirestore.instance
           .collection('agendas')
           .snapshots(),

       builder: (BuildContext context, AsyncSnapshot snapshot) {
         if(snapshot.hasData ){
           final agendas =snapshot.data!;
           return ListView.builder(itemCount :snapshot.data!.docs.length,itemBuilder:(context,index) {
             DocumentSnapshot documentSnapshot =snapshot.data!.docs[index];
             return Card(
                 child:ListTile(
                   tileColor: Colors.white,

                   title: Text(documentSnapshot.get("title"),
                     style: TextStyle(
                       color: Palette.blue,
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'OpenSans',
                     ),),

                   subtitle:
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Icon(Icons.person),
                       Text(documentSnapshot.get("Persone"),
                         style: TextStyle(
                           color: Palette.black,
                           fontSize: 10,
                           fontWeight: FontWeight.normal,
                           fontFamily: 'OpenSans',
                         ),),
                       Icon(Icons.location_on_outlined),
                       Text(documentSnapshot.get("Location"),
                         style: TextStyle(
                           color: Palette.black,
                           fontSize: 10,
                           fontWeight: FontWeight.normal,
                           fontFamily: 'OpenSans',
                         ),),
                     ], ),

                   leading:  Column(
                     children: [
                       Text(documentSnapshot.get("startTime"),
                         style: TextStyle(
                           color: Palette.black,
                           fontSize: 15,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'OpenSans',
                         ),),
                       Text(" - "),
                       Text(documentSnapshot.get("endTime"),
                         style: TextStyle(
                           color: Palette.black,
                           fontSize: 15,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'OpenSans',
                         ),),
                     ], ),

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

                   trailing:Icon(Icons.arrow_forward_ios_rounded), // if zoom we add video icon
                   onTap:(){
                     //Navigator.push(context,MaterialPageRoute(builder: (context)=> postInformation(documentSnapshot)));
                   },
                 )
             );
           },
           );
         }
         else{
           return Center(
             child:Text("please agin"),
           );
         }
       }),
       */
            ],
    ),

  );
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