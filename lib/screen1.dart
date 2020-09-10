import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animate_do/animate_do.dart';
import 'dart:math';

int a = 0;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/2');
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.amber[600],
        splashColor: Colors.yellow,
      ),
      body: PageBody(),
    );
  }
}

class PageBody extends StatefulWidget {
  var streamData;
  PageBody() {
    final firestore = FirebaseFirestore.instance;

    streamData = firestore.collection('confessions').orderBy("time").snapshots();
  }

  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Thapar Confessions',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 35,
                      color: Color(0xffe0e0e0),
                      letterSpacing: 2.5),
                ),
              ),
              Expanded(
                child: Container(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      children: [
                        StreamBuilder<QuerySnapshot>(
                          stream: widget.streamData,
                          //firestore.collection('confessions').snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final text = snapshot.data.docs;
                              List<Widget> allConf = [];
                              for (var confession in text) {
                                final message = confession.get('text');
                                final messageWid = ConfData(
                                  conftexts: message,
                                );
                                allConf.add(messageWid);
                              }
                              return Expanded(
                                child: ListView(
                                  addRepaintBoundaries: true,
                                  shrinkWrap: true,
                                  children: allConf,
                                ),
                              );
                            } else
                              return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                  // height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffe0e0e0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                ),
              ),
            ],
          ) //,
        ],
      ),
    );
  }
}

class ConfData extends StatelessWidget {
  final Color color3 = Color(0xff3ACBD9);
  final Color color1 = Color(0xffe1e228).withOpacity(0.8);
  final Color color0 = Color(0xffee665e);
  final Color color2 = Color(0xff3bb273);
  // final Color color7 = Color(0xff90D1E1);
  // final Color color2 = Color(0xffF2E6E0);
  // final Color color6 = Color(0xffDED2AA);
  // final Color color0 = Color(0xffC7A26B);
  // final Color color9 = Color(0xffA3CB8F);
  // final Color color3 = Color(0xffC0DEA9);
  Random random = new Random();
  Color useCol = Colors.white;
  String conftexts;
  ConfData({this.conftexts}) {
    print(a);
    switch (a) {
      case 0:
        useCol = color0;
        break;
      case 1:
        useCol = color1;
        break;
      case 2:
        useCol = color2;
        break;
      case 3:
        useCol = color3;
        break;
    }
    a = (a + 1) % 4;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ZoomIn(
          child: Container(
            padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
            child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    text: "$conftexts")),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: useCol,
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
