import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/config/palette.dart';
import 'package:intl/intl.dart';

import '../Agenda/InfoAgenda.dart';

class UserInformation extends StatelessWidget {

  String formattedDate(timeStamp){
    var dateFromTimeStamp=DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds *1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
  }
  final DocumentSnapshot documentSnapshot;
  UserInformation(this.documentSnapshot, );
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(documentSnapshot.get("nameWithPosition"),style: TextStyle( fontFamily: 'OpenSans'  ),),
         backgroundColor: Palette.darkBlue,
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment:CrossAxisAlignment.stretch,
              children: [
                //name
                documentSnapshot.get("nameWithPosition").toString()!=""?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //name
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                      color: Palette.lightGray,
                      child:  const Text(
                        "Name",
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
                        documentSnapshot.get("nameWithPosition").toString(),
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
                //end name

                //nationality
                documentSnapshot.get("nationality").toString()!=""?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //nationality
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                      margin: const EdgeInsets.only(top: 20.0),
                      color: Palette.lightGray,
                      child:  const Text(
                        "Nationality",
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
                        documentSnapshot.get("nationality").toString(),
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
                //end nationality

                //Position
                documentSnapshot.get("Position").toString()!=""?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //name
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                      margin: const EdgeInsets.only(top: 20.0),
                      color: Palette.lightGray,
                      child:  const Text(
                        "Position",
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
                        documentSnapshot.get("Position").toString(),
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
                //end Position

                //countryOfResidency
                documentSnapshot.get("countryOfResidency").toString()!=""?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //name
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                      margin: const EdgeInsets.only(top: 20.0),
                      color: Palette.lightGray,
                      child:  const Text(
                        "Country of Residency",
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
                        documentSnapshot.get("countryOfResidency").toString(),
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
                //end countryOfResidency

                //affiliation
                documentSnapshot.get("affiliation").toString()!=""?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //name
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                      margin: const EdgeInsets.only(top: 20.0),
                      color: Palette.lightGray,
                      child:  const Text(
                        "Affiliation",
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
                        documentSnapshot.get("affiliation").toString(),
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
                //end affiliation

                //email
                documentSnapshot.get("email").toString()!=""?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //email
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                      margin: const EdgeInsets.only(top: 20.0),
                      color: Palette.lightGray,
                      child:  const Text(
                        "Email",
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
                        documentSnapshot.get("email").toString(),
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
                  ],
                ):const SizedBox(),
                //end email

                //theme
                documentSnapshot.get("theme").toString()!=""?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //email
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                      margin: const EdgeInsets.only(top: 20.0),
                      color: Palette.lightGray,
                      child:  const Text(
                        "Theme",
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
                        documentSnapshot.get("theme").toString(),
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
                //end theme

                //title
                documentSnapshot.get("title").toString()!=""?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //title
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                      margin: const EdgeInsets.only(top: 20.0),
                      color: Palette.lightGray,
                      child:  const Text(
                        "Presentation Subject",
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
                          documentSnapshot.get("title").toString(),
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
                      onTap: (){
                        if(documentSnapshot.get("agendaId")!="")
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> AgendaInfo(documentSnapshot.get("agendaId"),"")));
                      },
                    ),
                  ],
                ):const SizedBox(),
                //end title
              ],
            ),
          ],
        )
    );

  }
}
