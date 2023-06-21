import 'dart:math';
import 'package:flutter/material.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import '../Function/Build_MyButton_ScreenBack.dart';
import '../Function/File_Function.dart';

AnswerManager vAnswerManager = AnswerManager();
List listStringCount = [];
Map mapAnswer = {};

class Screen_Anyword extends StatefulWidget {
  Screen_Anyword({Key? key}) : super(key: key);
  final List listString = vAnswerManager.getAnswer();

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
              icon: Icon(Icons.settings_rounded,),
              label: Text("Setting"),
              onPressed: () {
                Navigator.pushNamed(context, "/anyword_setting");
              })
        ],
        widBody: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/pixelsora.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "마법의 소라에몬",
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
              Text(strShow, style: TextStyle(fontSize: 20)),
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
              Button_Screenback(routename: '/home'),
              // ElevatedButton.icon(
              //   icon: Icon(Icons.arrow_back_rounded),
              //   label: Text("back to main"),
              //   onPressed: () {
              //     if (Navigator.canPop(context)) {
              //       Navigator.pop(context);
              //     } else {
              //       Navigator.popAndPushNamed(context, '/home');
              //     }
              //   },
              // ),
              Visibility(
                visible: false,
                child: Column(
                  children: [
                    Text(
                      "Total String : ${listStringCount.length}",
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 150),
                      margin: EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Text("$listStringCount"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
