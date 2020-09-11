import 'package:TC/initialscreen.dart';
import 'package:TC/screen1.dart';
import 'package:TC/screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
    .then((_) {
      runApp(new MyApp());
    });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ThaparConfessions',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff364051),
        primaryColor: Colors.black,  
      ),
     initialRoute: '/',
      routes: {
        '/' : (context)=>InitialScreen(),
        '/1' : (context)=>LoadingScreen(),
        '/2' : (context)=>Screen2(),

      },
    );
  }
}
