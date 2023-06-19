
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_conch/BaseAnswer.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';

import '../Function/Build_MyButton_ScreenBack.dart';

class Screen_AnywordSetting extends StatefulWidget {
  const Screen_AnywordSetting({Key? key}) : super(key: key);
  @override
  State<Screen_AnywordSetting> createState() => _Screen_AnywordSettingState();
}

class _Screen_AnywordSettingState extends State<Screen_AnywordSetting> {
  @override
  Widget build(BuildContext context) {
    return BuildMyScreen(
        strTitle: "Anyword Setting",
        widBody: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Text(mapBaseAnswer.keys.toString()),
              ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.save_alt), label: Text("Apply")),
              Button_Screenback(label: Text('back'), routename: '/anyword_setting'),
            ],
          ),
        ));
  }
}
