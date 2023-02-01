import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ices2023/screens/home/businessCard/businessCard.dart';
import 'package:ices2023/screens/home/people/listOfPeople.dart';
import 'package:ices2023/services/auth.dart';
import 'package:ices2023/screens/home/Agenda/ListOfAgenda.dart';

//auth? go home: go sign up
import 'package:provider/provider.dart';

import 'models/user.dart';
import 'screens/wrapper.dart';

Future<void> main() async {
  //for linking flutter to firebase - Android
  WidgetsFlutterBinding.ensureInitialized();

  //for linking flutter to firebase - web
  if(kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDAJHOdC_SeEeZoWhWJaRvDzs5B9Njj3jE",
            appId: "1:704605794254:web:50beffa90b49cf335cc59f",
            messagingSenderId: "704605794254",
            projectId: "ices2023",
            /*optional*/
            authDomain: "ices2023.firebaseapp.com",
            storageBucket: "ices2023.appspot.com",
            measurementId: "G-EJHT4T8BHX"
        )
    );
  } else {
    await Firebase.initializeApp();
  }

  //the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context)=>const Wrapper(),
          "/agenda": (context)=>const Wrapper(),
          "/people": (context)=> const ListOfPeople(),
          "/note": (context)=>const Wrapper(),
          "/card": (context)=>const businessCard(),
          "/index": (context)=>const Wrapper(),
        },
      ),
    );
  }
}