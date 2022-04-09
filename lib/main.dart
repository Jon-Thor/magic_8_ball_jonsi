import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
  MaterialApp(
    home: BallPage(),
  ),
);


class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title:Center(child: Text("ask me anything")),
        backgroundColor: Colors.blue[900],
      ),
      body: Ball(
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _Ball createState() => _Ball();
}

class _Ball extends State<Ball> {
  int subtitle = 0;
  List<String> SubtitleList = ["", "","",
    "",""];
  int Ballnumber = Random().nextInt(5) + 1;
  void BallNumber() {
    setState(() {
      Ballnumber = Random().nextInt(5) + 1;
    });
  }
  void Subtitles() {
    setState(() {
      if(subtitle == 1){
      subtitle = 0;
    } else if (subtitle == 0){
      subtitle =1;
    }
    if(subtitle == 1){
      SubtitleList = ["yes", "No","Ask Again Later",
        "The Answer is Yes","I have no Idea"];
    }else if (subtitle == 0){
      SubtitleList = ["", "","",
        "",""];}
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: 300,
            child:Center(child: Text(SubtitleList[Ballnumber - 1],
            style: TextStyle(fontSize: 40),
            )),
          ),
          Expanded(
              child: TextButton(
                onPressed: (){
                  BallNumber();
                },
              child: Center(
                  child: Image.asset("images/ball$Ballnumber.png"),),),),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0,
                horizontal: 25.0),
            child: TextButton(
              onPressed: (){
                Subtitles();
              },
            child: ListTile(
                title:Center(child: Text("Subtitles",
                  style: TextStyle(
                    fontSize: 30,
                  )),
                ))
            ),
          )
        ],
      ),
    );
  }
}

