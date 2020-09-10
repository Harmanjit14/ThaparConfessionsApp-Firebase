import 'package:TC/screen1.dart';
import 'package:flutter/material.dart';

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
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.centerRight,
              height: MediaQuery.of(context).size.height * 0.25,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
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
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Completely Anonymous',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffe0e0e0),
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                //alignment: AlignmentDirectional.bottomCenter,
                //color: Colors.red,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Image.asset('lib/assets/gif1.gif'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: AlignmentDirectional.bottomStart,
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                color: Color(0xff364051),
                              ),
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 70,
                              child: Text(
                                'Made with ❤ by Harmanjit14',
                                style: TextStyle(
                                    color: Color(0xffe0e0e0), fontSize: 18),
                              ),
                            ),
                          ),
                          Container(
                            //color: Colors.red,
                            child: FlatButton(
                              onPressed: ()
                              {
                                PageBody();
                                Navigator.pushReplacementNamed(context, '/1');
                              },
                              child: Icon(
                                Icons.navigate_next,
                                size: 60,
                                color: Color(0xff364051),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
