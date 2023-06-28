import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import 'package:magic_conch/Function/Button_Homemenu.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:magic_conch/ad_helper.dart';

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
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Image.asset('assets/images/pixelsora.png')),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button_Home(
                      strName: "아무말 대잔치",
                      ButtonFunction: () {
                        Navigator.pushNamed(context, '/anyword');
                      }),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button_Home(
                        strName: "룰렛 돌리기 (테스트 필드)",
                        ButtonFunction: () {
                          Navigator.pushNamed(context, '/testfiled');
                        }),
                  )),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button_Home(
                        strName: "폭탄 돌리기 (준비중)", ButtonFunction: () {}),
                  )),
              // Expanded(
              //     flex: 1,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Button_Home(
              //           strName: "만든이 (준비중)", ButtonFunction: () {}),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
