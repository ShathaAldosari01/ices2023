import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/config/palette.dart';
import 'package:ices2023/screens/home/people/userInfo.dart';

import '../../../shared/loading.dart';
import '../navbar/navbar.dart';

class ListOfPeople extends StatelessWidget {
  const ListOfPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: Navbar(),
    appBar: AppBar(
      title: const Text('People',style: TextStyle( fontFamily: 'OpenSans'  ),),
      backgroundColor: Palette.darkBlue,
    ),
    body:StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('user1').orderBy('name')
          .snapshots(),
       builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData ){
         return ListView.builder(itemCount :snapshot.data!.docs.length,itemBuilder:(context,index) {
           DocumentSnapshot documentSnapshot =snapshot.data!.docs[index];
           return Card(
               child:ListTile(
                 title: Text(documentSnapshot.get("name"),style: const TextStyle( fontFamily: 'OpenSans'  ),),
                 subtitle:Text(documentSnapshot.get("role"),style: const TextStyle( fontFamily: 'OpenSans'  ),) ,
                 leading:const CircleAvatar(
                     backgroundColor: Palette.yellow) ,
                 trailing:const Icon(Icons.arrow_forward_ios_rounded),
                 onTap:(){
                   Navigator.push(context,MaterialPageRoute(builder: (context)=> UserInformation(documentSnapshot)));
                 },
           )
           );
         },

         );}
        else{
          return const Center(
              child: Loading(),
          );
        }

      }),
    );
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('People'),
      ),
    );
  }



