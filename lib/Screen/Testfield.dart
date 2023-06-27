import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import 'package:magic_conch/Function/File_Function.dart';
import 'package:path_provider/path_provider.dart';

import '../Function/Build_MyButton_ScreenBack.dart';

String strRoute = "";
String strSaveMsg = "Test String";
String strSaveResult = "";
String strLoadmsg = "";
String strLoadResult = "";

class Testfield extends StatefulWidget {
  const Testfield({super.key});

  @override
  State<Testfield> createState() => _TestfieldState();
}

class _TestfieldState extends State<Testfield> {
  @override
  Widget build(BuildContext context) {
    return BuildMyScreen(
        strTitle: "Test Filed",
        widBody: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Route : $strRoute"),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      strRoute = "$FileManager().getRoute()";
                    });
                  }, child: Text("get route")),
                  Text(" "),
                  Text("Save String : $strSaveMsg"),
                  Text("Reslut : $strSaveResult"),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      strSaveResult = FileManager().write_auto(strSaveMsg).toString();
                    });
                  }, child: Text("Save")),
                  Text(" "),
                  Text("Load Msg : $strLoadmsg"),
                  Text("Reslut : $strLoadResult"),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      strLoadResult = FileManager().read_auto().toString();
                    });
                  }, child: Text("Load")),
                  Text(" "),
                  Text(" "),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      strRoute = "";
                      strSaveMsg="";
                      strSaveResult="";
                      strLoadmsg = "";
                      strLoadResult = "";
                    });
                  }, child: Text("Reset")),
                  Text(" "),
                  Button_Screenback(routename: '/home'),
                ],
              ),
            ),
          ),
        ));
  }
}
