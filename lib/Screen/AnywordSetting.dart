import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_conch/Data/BaseAnswer.dart';
import 'package:magic_conch/Data/DataManager.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import '../Function/Build_MyButton_ScreenBack.dart';

//Map vAnyword = DataManager().getDataAnyword().mapAnswer;
Data_Anyword vAnyword = DataManager().getDataAnyword();

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
                    itemCount:
                        DataManager().getDataAnyword().getGroupsList().length,
                    itemBuilder: (context, index) {
                      String strGroup =
                          vAnyword.getGroupsList().elementAt(index);
                      bool vCheck = vAnyword.getGroup_Show(strGroup);
                      //var vmAnswer = vAnyword.getGroup(strGroup);

                      return Container(
                        child: Column(children: [
                          ExpansionTile(
                            title: Text(strGroup),
                            //textColor: Colors.white,
                            //backgroundColor: Colors.orangeAccent,
                            //collapsedBackgroundColor: Colors.orangeAccent,
                            initiallyExpanded: false,
                            leading: Checkbox(
                              value: vCheck,
                              activeColor: Colors.black,
                              onChanged: (vCheck) {
                                setState(() {
                                  vAnyword.setGroup_Show(strGroup, vCheck!);
                                });
                              },
                            ),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                                itemCount:
                                    vAnyword.getSentenceUnit(strGroup).length,
                                itemBuilder: (context, index) {
                                  // 여기 이상하네 잘못했따.
                                  List temp = vAnyword.getSentenceUnit(strGroup);
                                  if (temp.isEmpty) {
                                    return Text("No Answer");
                                  }
                                  bool bShow = temp[index][0];
                                  return CheckboxListTile(
                                    //tileColor: Colors.deepOrange,
                                    activeColor: Colors.black,
                                    title: Text(temp[index][1].toString()),
                                    value: bShow,
                                    onChanged: (bShow) {
                                      setState(() {
                                        vAnyword.setShow_SentenceIndex(strGroup, index, bShow!);
                                      });
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  );
                                },
                              ),
                            ],
                          ),
                        ]),
                      );
                    },
                  ),
                  //Text("Total Group : " + vAnyword.getGroupsList().toString()),
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
