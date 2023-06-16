import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import 'package:magic_conch/Function/Button_Homemenu.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return BuildMyScreen(
      strTitle: '마법의 소라에몬 : 결정장애 브레이커',
      widBody: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 100),
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: Image.asset('assets/images/pixelsora.png')),
              Button_Home(
                  strName: "아무말 대잔치",
                  ButtonFunction: () {
                    Navigator.pushNamed(context, '/anyword');
                  }),
              SizedBox(height: 10),
              Button_Home(strName: "룰렛 돌리기", ButtonFunction: () {}),
              SizedBox(height: 10),
              Button_Home(strName: "폭탄 돌리기", ButtonFunction: () {}),
              SizedBox(height: 10),
              Button_Home(strName: "만든이", ButtonFunction: () {}),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
