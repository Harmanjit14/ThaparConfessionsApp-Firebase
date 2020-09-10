import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: InitBody(),
    );
  }
}

class InitBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerRight,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff364051),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
              ),
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Thapar Confessions',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 30,
                            color: Color(0xffe0e0e0),
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Thapar Confessions',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 30,
                            color: Color(0xffe0e0e0),
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
