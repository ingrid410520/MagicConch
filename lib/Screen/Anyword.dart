import 'dart:math';
import 'package:flutter/material.dart';
import 'package:magic_conch/Data/DataManager.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import '../Function/Build_MyButton_ScreenBack.dart';
import '../Function/File_Function.dart';

AnswerManager vAnswerManager = AnswerManager();

List listStringCount = [];
Map mapAnswer = {};

class Screen_Anyword extends StatefulWidget {
  Screen_Anyword({Key? key}) : super(key: key);

  // Load Answer list
  //final List listString = vAnswerManager.getAnswer();
  final List listString = DataManager().GetAnyword_List();

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

    mapAnswer.addAll(mapAnswer);
  }

  Widget build(BuildContext context) {
    return BuildMyScreen(
        strTitle: "아무말 대잔치",
        action: [
          ElevatedButton.icon(
              icon: Icon(
                Icons.settings_rounded,
              ),
              label: Text("Setting"),
              onPressed: () {
                Navigator.pushNamed(context, "/anyword_setting");
              })
        ],
        widBody: buildAnywordBody());
  }

  Container buildAnywordBody() {
    return Container(
      height: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 100, horizontal: 100),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTopimage(),
            buildShowString(),
            buildPlayButton(),
            Flexible(child: Button_Screenback(routename: '/home')),
            //buildDebug_CountAnyword(),
          ],
        ),
      ),
    );
  }

  Flexible buildDebug_CountAnyword() {
    return Flexible(
            child: Visibility(
              visible: true,
              child: Column(
                children: [
                  Text(
                    "Total String : ${listStringCount.length}",
                  ),
                  Container(
                    child: Text("$listStringCount"),
                  )
                ],
              ),
            ),
          );
  }

  Flexible buildPlayButton() {
    return Flexible(
      child: Column(
        children: [
          Flexible(
            child: ElevatedButton.icon(
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
          ),
          SizedBox(
            height: 10,
          ),
          Text("Total String : ${listStringCount.length}"),
        ],
      ),
    );
  }

  Flexible buildShowString() {
    return Flexible(
      child: SizedBox(
          height: 100,
          child: Text(strShow, style: TextStyle(fontSize: 20))),
    );
  }

  Expanded buildTopimage() {
    return Expanded(
        flex: 3,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(child: Image.asset('assets/images/pixelsora.png',fit: BoxFit.scaleDown)),
              SizedBox(height: 20),
              Text(
                "마법의 소라에몬",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ));
  }
}
