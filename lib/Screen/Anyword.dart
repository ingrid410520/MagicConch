import 'dart:math';
import 'package:flutter/material.dart';
List listStringCount = [];
class Screen_Anyword extends StatefulWidget {
  Screen_Anyword({Key? key}) : super(key: key);

  List listString = [
    // Positive
    "당장 고백박어",
    "인내심은 일단 길러볼 일이다.",
    "키스갈겨",
    "콩 한쪽이라도 나눠먹어라",
    "나쁜 짓 하면 다 돌아온다",
    "걔도 너 좋아해",

    // Negative
    "꿈 깨",
    "도망쳐",
    "거울 보고 말해",
    "여기서 포기할꺼야?",
    "때려쳐",
    "배신은 달콤한 것",
    "내로남불",
  ];


  @override
  State<Screen_Anyword> createState() => _Screen_AnywordState();
}

class _Screen_AnywordState extends State<Screen_Anyword> {
  String strShow = "Ready !!";

  @override
  void initState() {
    super.initState();
    listStringCount =
        List.filled(Screen_Anyword().listString.length, 0, growable: true);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("아무말 대잔치"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Image"),
            Text(strShow),
            ElevatedButton.icon(
              icon: Icon(Icons.play_arrow_rounded),
              label: Text('Play'),
              onPressed: () {
                setState(() {
                  String newString = "";
                  int maxNum = Screen_Anyword().listString.length;
                  int rNum = 0;
                  do {
                    rNum = Random().nextInt(maxNum);
                    newString = Screen_Anyword().listString[rNum];
                  } while (strShow == newString);
                  strShow = newString;
                  listStringCount[rNum]++;
                });
              },
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_back_rounded),
              label: Text("back to main"),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  Navigator.popAndPushNamed(context, '/home');
                }
              },
            ),
            Text(listStringCount.toString())

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.settings_rounded), onPressed: () {}),
    );
  }
}
