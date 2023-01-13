import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/wrapper.dart';

Future<void> main() async {
  //for linking flutter to firebase - Android
  WidgetsFlutterBinding.ensureInitialized();

  //for linking flutter to firebase - web
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDAJHOdC_SeEeZoWhWJaRvDzs5B9Njj3jE",
          appId: "1:704605794254:web:50beffa90b49cf335cc59f",
          messagingSenderId: "704605794254",
          projectId: "ices2023",
          /*optoinal*/
          authDomain: "ices2023.firebaseapp.com",
          storageBucket: "ices2023.appspot.com",
          measurementId: "G-EJHT4T8BHX"
      )
    );

    await Firebase.initializeApp();
  }

  //the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Wrapper(),
    );
  }
}
