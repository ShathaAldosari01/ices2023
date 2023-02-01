import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/config/palette.dart';
import 'package:ices2023/shared/loading.dart';
import 'package:intl/intl.dart';

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
                    const Text("Person Information",textAlign:TextAlign.center ,
                      style: TextStyle(fontSize:16 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                    ),
                    Text(userData["nameWithPosition"],textAlign:TextAlign.center ,
                      style: const TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white,fontFamily: 'OpenSans',fontWeight: FontWeight.bold ),

                    ),
                    const Text("Nationality",textAlign:TextAlign.center ,
                      style: TextStyle(fontSize:10 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                    ),
                    Text(userData["nationality"],textAlign:TextAlign.center ,
                      style: const TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),

                    ),
                    const Text("Position",textAlign:TextAlign.center ,
                      style: TextStyle(fontSize:10 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                    ),
                    Text(userData["Position"],textAlign:TextAlign.center ,
                      style: const TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),

                    ),

                    const Text("Country Of Residency",textAlign:TextAlign.center ,
                      style: TextStyle(fontSize:10 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                    ),
                    Text(userData["countryOfResidency"],textAlign:TextAlign.center ,
                      style: const TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),

                    ),
                    const Text("Affiliation",textAlign:TextAlign.center ,
                      style: TextStyle(fontSize:10 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                    ),
                    Text(userData["affiliation"],textAlign:TextAlign.center ,
                      style: const TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),

                    ),
                    const Text("Email",textAlign:TextAlign.center ,
                      style: TextStyle(fontSize:10 , fontStyle:FontStyle.normal , color:Palette.darkBlue,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),

                    ),
                    Text(userData["email"],textAlign:TextAlign.center ,
                      style: const TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),

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
                      const Text("Theme",textAlign:TextAlign.center ,
                        style: TextStyle(fontSize:16 , fontStyle:FontStyle.normal ,color:Palette.darkBlue,fontFamily: 'OpenSans',fontWeight: FontWeight.bold ),
                      ),
                      // Text(formattedDate(documentSnapshot.get("date")),textAlign:TextAlign.center ,
                      //
                      //   style: TextStyle(fontSize:14 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),
                      // ),
                      Text(userData["theme"],textAlign:TextAlign.center ,
                        style: const TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold),
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
                      const Text("Presentation Subject",textAlign:TextAlign.center ,
                        style: TextStyle(fontSize:16 , fontStyle:FontStyle.normal ,color:Palette.darkBlue ,fontFamily: 'OpenSans' ,fontWeight: FontWeight.bold ),
                      ),
                      // Text(formattedDate(documentSnapshot.get("date")),textAlign:TextAlign.center ,
                      //   style: TextStyle(fontSize:14 , fontStyle:FontStyle.normal , color:Colors.white ,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),
                      // ),
                      Text(userData["title"],textAlign:TextAlign.center ,
                        style: const TextStyle(fontSize:9 , fontStyle:FontStyle.normal , color:Colors.white,fontFamily: 'OpenSans',fontWeight: FontWeight.bold ),
                      ),
                    ]
                )
            ),
          ],
        )
    );

  }
}
