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
  TextEditingController _strAddGroup = TextEditingController();
  TextEditingController _strAddAnswer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BuildMyScreen(
      strTitle: "Anyword Setting",
      widBody: buildContens(),
      bottom: buildBottomWidget(),
    );
  }

  SingleChildScrollView buildContens() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Build_Answer(),
              //Text("Total Group : " + vAnyword.getGroupsList().toString()),
              Add_Group()
            ],
          ),
        ),
      ),
    );
  }

  Container Add_Group() {
    return Container(
              height: 50,
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: Text("Add Group"),
                leading: Icon(Icons.add),
                onTap: () {
                  print("Add Group Tap !!");
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Insert Answer"),
                          //insetPadding: EdgeInsets.symmetric(horizontal: 200, vertical: 350),
                          actions: [
                            MaterialButton(
                                child: Text("OK"),
                                onPressed: () {
                                  setState(() {
                                    // Add Answer
                                    vAnyword.addGroup(_strAddGroup.text);
                                    Navigator.pop(context);
                                  });
                                }),
                            MaterialButton(
                                child: Text("Cancle"),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                          content: Container(
                            height: 100,
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextField(
                                  controller: _strAddGroup,
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  });
                },
              ),
            );
  }

  ListView Build_Answer() {
    return ListView.builder(
              shrinkWrap: true,
              itemCount: vAnyword.getGroupsList().length,
              itemBuilder: (context, index) {
                String strGroup = vAnyword.getGroupsList().elementAt(index);
                bool vCheck = vAnyword.getGroup_Show(strGroup);
                //var vmAnswer = vAnyword.getGroup(strGroup);

                return Column(children: [
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
                          print("Group Checkbox : $vCheck");
                          vAnyword.setGroup_Show(strGroup, vCheck!);
                        });
                      },
                    ),
                    children: [
                      Listbuilder_Answer(strGroup),
                      Add_Sentece(context, strGroup),
                    ],
                  ),
                ]);
              },
            );
  }

  ListView Listbuilder_Answer(String strGroup) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
      itemCount: vAnyword.getSentenceUnit(strGroup).length,
      itemBuilder: (context, index) {
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
              print("Check Answer : $strGroup, $index, $bShow");
              vAnyword.setShow_SentenceIndex(strGroup, index, bShow!);
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }

  Container Add_Sentece(BuildContext context, String strGroup) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
      //color: Colors.cyan,
      height: 50,
      alignment: Alignment.centerLeft,
      child: ListTile(
        title: Text("Add Answer"),
        leading: Icon(Icons.add),
        onTap: () {
          //print("Add Answer Tap !!");
          setState(() {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Insert Answer"),
                  //insetPadding: EdgeInsets.symmetric(horizontal: 200, vertical: 350),
                  actions: [
                    MaterialButton(
                        child: Text("OK"),
                        onPressed: () {
                          setState(() {
                            // Add Answer
                            vAnyword.addSentence(strGroup, _strAddAnswer.text);
                            Navigator.pop(context);
                          });
                        }),
                    MaterialButton(
                        child: Text("Cancle"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                  content: Container(
                    height: 100,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          controller: _strAddAnswer,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          });
        },
      ),
    );
  }

  Container buildBottomWidget() {
    return Container(
      color: Colors.blueGrey,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Button_Screenback(
              label: Text(' back'),
              routename: '/anyword',
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(150, 50)),
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.deepOrange))),
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  print("Anyword Setting Apply");
                  DataManager().Save_Anyword();
                });
              },
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(150, 50))),
              icon: Icon(Icons.save_as_rounded),
              label: Text("  Apply")),
        ],
      ),
    );
  }
}
