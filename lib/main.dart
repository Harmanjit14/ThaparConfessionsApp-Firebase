import 'package:TC/screen1.dart';
import 'package:TC/screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ThaparConfessions',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[400],
        primaryColor: Colors.black,
      ),
     initialRoute: '/',
      routes: {
        '/' : (context)=>LoadingScreen(),
        '/2' : (context)=>Screen2(),

      },
    );
  }
}
