import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/config/palette.dart';
import 'package:ices2023/shared/loading.dart';
import 'package:intl/intl.dart';

import '../Agenda/InfoAgenda.dart';

class UserInformation extends StatefulWidget {

  final String uid;
  UserInformation(this.uid, );

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {

  String formattedDate(timeStamp){
    var dateFromTimeStamp=DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds *1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
  }

  //att
  var userData = {};
  bool loading = true;

  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    try {
      if (widget.uid != null) {
        var userSnap = await FirebaseFirestore.instance
            .collection('user1')
            .doc(widget.uid)
            .get();

        setState(() {
          userData = userSnap.data()!;
          loading = false;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context){
    return loading? const Loading():
    Scaffold(
        appBar: AppBar(
          title: Text(userData["nameWithPosition"],style: const TextStyle( fontFamily: 'OpenSans'  ),),
          backgroundColor: Palette.darkBlue,
        ),

        body: ListView(
          children:[
            Column(
              crossAxisAlignment:CrossAxisAlignment.stretch,
              children: [
                //name
                userData["nameWithPosition"].toString()!=""?
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
                        userData["nameWithPosition"].toString(),
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
                userData["nationality"].toString()!=""?
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
                        userData["nationality"].toString(),
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
                userData["Position"].toString()!=""?
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
                        userData["Position"].toString(),
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
                userData["countryOfResidency"].toString()!=""?
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
                        userData["countryOfResidency"].toString(),
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
                userData["affiliation"].toString()!=""?
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
                        userData["affiliation"].toString(),
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
                userData["email"].toString()!=""?
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
                        userData["email"].toString(),
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
                userData["theme"].toString()!=""?
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
                        userData["theme"].toString(),
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
                userData["title"].toString()!=""?
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
                          userData["title"].toString(),
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
                        if(userData["agendaId"]!="")
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> AgendaInfo(userData["agendaId"],"")));
                      },
                    ),
                  ],
                ):const SizedBox(),
                //end title
              ],
            ),
          ]
        )
    );

  }
}
