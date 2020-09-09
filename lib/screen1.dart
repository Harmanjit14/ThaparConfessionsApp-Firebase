
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animate_do/animate_do.dart';
import 'dart:math';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('working');
        },
        child: Icon(
          Icons.add,
          //color: Colors.grey[200],
        ),
        backgroundColor: Colors.amber,
        splashColor: Colors.yellow,
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        title: Text(
          'Thapar Confessions',
          style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
        ),
      ),
      body: PageBody(),
    );
  }
}

class PageBody extends StatefulWidget {
  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  var snapshot;
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: firestore.collection('confessions').snapshots(),
            // ignore: missing_return
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
                    shrinkWrap: true,
                    children: allConf,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ConfData extends StatelessWidget {
  final Color color1 = Color(0xffFDE3AA);
  final Color color5 = Color(0xffEEBADF);
  final Color color8 = Color(0xffAEB5E7);
  final Color color4 = Color(0xffBBE6E1);
  final Color color7 = Color(0xff90D1E1);
  final Color color2 = Color(0xffF2E6E0);
  final Color color6 = Color(0xffDED2AA);
  final Color color0 = Color(0xffC7A26B);
  final Color color9 = Color(0xffA3CB8F);
  final Color color3 = Color(0xffC0DEA9);
  Random random = new Random();
  Color useCol = Colors.white;
  String conftexts;
  ConfData({this.conftexts}) {
     int a = random.nextInt(10);
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
      case 4:
        useCol = color4;
        break;
      case 5:
        useCol = color5;
        break;
      case 6:
        useCol = color6;
        break;
      case 7:
        useCol = color7;
        break;
      case 8:
        useCol = color8;
        break;
      case 9:
        useCol = color9;
        break;

      default:
    }
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
