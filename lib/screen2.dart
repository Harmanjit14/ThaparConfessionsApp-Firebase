import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String confess;

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        title: Text(
          'Thapar Confessions',
          style: TextStyle(fontFamily: 'Pacifico', fontSize: 25,color: Color(0xffe0e0e0),),
        ),
      ),
      body: Container(
        child: ConContainer(),
        margin: EdgeInsets.all(20),
      ),
    );
  }
}

class ConContainer extends StatefulWidget {
  @override
  _ConContainerState createState() => _ConContainerState();
}

class _ConContainerState extends State<ConContainer> {
  final snackBar = SnackBar(
    duration: Duration(seconds:5),
    content: Text('Confession Added!!'),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  confess = value;
                });
              },
              style: TextStyle(
                fontSize: 18,
                color: Color(0xffe0e0e0),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.start,
              autocorrect: false,
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelStyle: TextStyle(
                    fontSize: 20, fontFamily: 'Pacifico', letterSpacing: 2,color: Color(0xffe0e0e0),),
                labelText: 'Write your confession',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () async {
                var tem;
                final obj = FirebaseFirestore.instance;
                try {
                  if (confess != "") {
                    await obj.collection('confessions').add({
                      'text': confess,
                    });
                    confess = "";
                  }
                } catch (e) {
                  tem = e;
                }
                if (tem == null) {
                  //Scaffold.of(context).showSnackBar(snackBar);
                }
                Navigator.pop(context);
              },
              backgroundColor: Colors.amber[600],
              child: Icon(
                Icons.check,
                color: Colors.grey[300],
              ),
              splashColor: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
