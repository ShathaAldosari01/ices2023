import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/config/palette.dart';
import 'package:ices2023/screens/home/Agenda/ListOfAgenda.dart';

class Navbar extends StatelessWidget {
  Navbar({Key? key}) : super(key: key);

  //att
  final FirebaseAuth _auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          /*ices2023*/
          const UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(""),
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),

          /*menu*/
          //1. agenda
          ListTile(
            textColor: Palette.black,
            leading: const Icon(
              Icons.view_agenda_outlined,
              color: Palette.darkBlue,
            ),
            title: const Text(
              "Agenda",
              style: TextStyle(
                fontFamily: 'OpenSans',
              ),
            ),
            onTap: (){
              /*go to agenda page*/
              Navigator.pushNamed(context, '/agenda');
            },
          ),
          const Divider(),

          //2. people
          ListTile(
            textColor: Palette.black,
            leading: const Icon(
              Icons.people_alt_outlined,
              color: Palette.darkBlue,
            ),
            title: const Text(
              "People",
              style: TextStyle(
                fontFamily: 'OpenSans',
              ),
            ),
            onTap: (){
              /*go to people page*/
              Navigator.pushNamed(context, '/people');
            },
          ),
          const Divider(),

          //6. log out
          ListTile(
            textColor: Palette.black,
            leading: const Icon(
              Icons.logout_outlined,
              color: Palette.darkBlue,
            ),
            title: const Text(
              "Log out",
              style: TextStyle(
                fontFamily: 'OpenSans',
              ),
            ),
            onTap: ()async{
              await _auth.signOut();
            },
          ),
          const Divider(),

        ],
      ),
    );
  }
}
