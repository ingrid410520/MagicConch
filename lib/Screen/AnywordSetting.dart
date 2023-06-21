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
                    itemCount: mapBaseAnswer.length,
                    itemBuilder: (context, index) {
                      String str = mapBaseAnswer.keys.elementAt(index);
                      var vmAnswer = mapBaseAnswer[str];
                      bool vCheck = vmAnswer['bShow'];

                      return Column(children: [
                        CheckboxListTile(
                          tileColor: Colors.amber,
                          activeColor: Colors.black,
                          title: Text(str),
                          value: vCheck,
                          onChanged: (vCheck) {
                            setState(() {
                              mapBaseAnswer[str]['bShow'] = vCheck!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,

                        ),
                        // ExpansionTile(
                        //     title: Text("data"),
                        //     leading: Checkbox(value: false, onChanged: (value) {
                        //       setState(() {
                        //       });
                        //     },),
                        //     children: [
                        //       Text("data1"),
                        //       Text("data2"),
                        //       Text("data3"),
                        //     ],
                        //   initiallyExpanded: true,
                        // ),
                        //Text(mapBaseAnswer[str]['Answer'][0][0].toString()),
                        //AnswerGroup(vCheck, "$vCheck $str", Colors.amberAccent),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                          itemCount: vmAnswer["Answer"].length,
                          itemBuilder: (context, index) {
                            bool bShow = mapBaseAnswer[str]['Answer'][index][0];
                            return Column(
                              children: [
                                CheckboxListTile(
                                  tileColor: Colors.amberAccent,
                                  activeColor: Colors.black,
                                  title: Text(mapBaseAnswer[str]['Answer'][index][1].toString()),
                                  value: bShow,
                                  onChanged: (bShow) {
                                    setState(() {
                                      mapBaseAnswer[str]['Answer'][index][0] = bShow!;
                                    });
                                  },
                                  controlAffinity:
                                  ListTileControlAffinity.leading,
                                )
                              ],
                            );
                          },
                        ),
                      ]);
                    },
                  ),
                  Text(mapBaseAnswer.keys.toString()),
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
