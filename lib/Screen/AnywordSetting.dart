import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:magic_conch/Data/BaseAnswer.dart';
import 'package:magic_conch/Data/DataManager.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import '../Function/Build_MyButton_ScreenBack.dart';

Map vAnyword = DataManager.mapLoadAnyword;

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
        widBody: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Center(
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: vAnyword.length,
                    itemBuilder: (context, index) {
                      String str = vAnyword.keys.elementAt(index);
                      var vmAnswer = vAnyword[str];
                      bool vCheck = vmAnswer['bShow'];

                      return Column(children: [
                        ExpansionTile(
                          title: Text(str),
                          //textColor: Colors.white,
                          //backgroundColor: Colors.orangeAccent,
                          //collapsedBackgroundColor: Colors.orangeAccent,
                          initiallyExpanded: false,
                          leading: Checkbox(
                            value: vCheck,
                            activeColor: Colors.black,
                            onChanged: (vCheck) {
                              setState(() {
                                vAnyword[str]['bShow'] = vCheck!;
                              });
                            },
                          ),
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                              itemCount: vmAnswer["Answer"].length,
                              itemBuilder: (context, index) {
                                bool bShow =
                                    vAnyword[str]['Answer'][index][0];
                                return CheckboxListTile(
                                  //tileColor: Colors.deepOrange,
                                  activeColor: Colors.black,
                                  title: Text(vAnyword[str]['Answer']
                                          [index][1]
                                      .toString()),
                                  value: bShow,
                                  onChanged: (bShow) {
                                    setState(() {
                                      vAnyword[str]['Answer'][index][0] =
                                          bShow!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                );
                              },
                            ),
                          ],
                        ),
                      ]);
                    },
                  ),
                  Text("Total String : " + vAnyword.keys.toString()),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.save_alt),
                      label: Text("Apply")),
                  Button_Screenback(label: Text('back'), routename: '/anyword'),
                ],
              ),
            ),
          ),
        ));
  }
}

ListTile AnswerGroup(
  bool bCheck,
  String strGroupName,
  Color cColor,
) =>
    ListTile(
      leading: Checkbox(
        value: bCheck,
        onChanged: (value) {},
      ),
      tileColor: cColor,
      titleTextStyle: TextStyle(color: Colors.black),
      title: Text(strGroupName),
    );
