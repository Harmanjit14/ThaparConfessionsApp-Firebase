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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final obj = FirebaseFirestore.instance;
          try {
            await obj.collection('confessions').add({
              'text': confess,
            });
          } catch (e) {
            print(e);
          }
          Navigator.pop(context);
        },
        backgroundColor: Colors.amber[600],
        child: Icon(
          Icons.check,
          color: Colors.grey[300],
        ),
        splashColor: Colors.greenAccent,
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
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
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlign: TextAlign.start,
                autocorrect: false,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontSize: 20, fontFamily: 'Pacifico', letterSpacing: 2),
                  labelText: 'Write your confession',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
