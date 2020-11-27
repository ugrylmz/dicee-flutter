import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Salla',
              style:TextStyle(fontSize:35.0 ))),
          elevation: 0.0,
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftSide = 1;
  int rightSide = 1;
  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
     setState(() {
       changeDiceFace();
     });
    });
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }
  void changeDiceFace(){
    setState(() => {
    leftSide = Random().nextInt(6) + 1,
    rightSide = Random().nextInt(6) + 1
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: ()  {
                changeDiceFace();
              },
              child: Image.asset('images/dice$leftSide.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: ()  {
                changeDiceFace();
              },
              child: Image.asset('images/dice$rightSide.png'),
            ),
          ),
        ],
      ),
    );
  }
}