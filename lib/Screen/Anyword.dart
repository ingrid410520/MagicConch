import 'dart:math';
import 'package:flutter/material.dart';
import 'package:magic_conch/Data/DataManager.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import '../Function/Build_MyButton_ScreenBack.dart';

//List listStringCount = [];
//Map mapAnswer = {};

class Screen_Anyword extends StatefulWidget {
  Screen_Anyword({Key? key}) : super(key: key);

  // Load Answer list
  //final List listString = vAnswerManager.getAnswer();
  //final List listString = DataManager().getDataAnyword().getSentences_ShowList();

  @override
  State<Screen_Anyword> createState() => _Screen_AnywordState();
}

class _Screen_AnywordState extends State<Screen_Anyword> {
  String strShow = "Ready !!";

  @override
  void initState() {
    super.initState();
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
            buildDebug_CountAnyword(),
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
              "Total String : ${DataManager().getDataAnyword().getSentences_ShowList().length}",
            ),
            Container(
              child: Text(" ??? "),
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
                  //print("Play!! ");
                  String newString = "";
                  int maxNum = DataManager().getDataAnyword().getSentences_ShowList().length;
                  int rNum = 0;
                  do {
                    rNum = Random().nextInt(maxNum);
                    newString = DataManager().getDataAnyword().getSentences_ShowList()[rNum];
                  } while (strShow == newString);
                  strShow = newString;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Flexible buildShowString() {
    return Flexible(
      child: SizedBox(
          height: 100, child: Text(strShow, style: TextStyle(fontSize: 20))),
    );
  }

  Widget buildTopimage() {
    return Flexible(
        flex: 3,
        child: Container(
          //color: Colors.deepOrange,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Image.asset('assets/images/pixelsora.png',
                      fit: BoxFit.scaleDown)),
              SizedBox(height: 20, width: double.maxFinite),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "마법의 소라에몬",
                  style: TextStyle(fontSize: 150,),
                ),
              ),
            ],
          ),
        ));
  }
}
