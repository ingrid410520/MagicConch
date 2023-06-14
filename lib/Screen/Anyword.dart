import 'package:flutter/material.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';

class Screen_Anyword extends StatefulWidget {
  const Screen_Anyword({Key? key}) : super(key: key);

  @override
  State<Screen_Anyword> createState() => _Screen_AnywordState();
}

class _Screen_AnywordState extends State<Screen_Anyword> {
  @override
  Widget build(BuildContext context) {
    return BuildMyScreen(
        strTitle: '아무말 대잔치', widBody: Center(child: Container()));
  }
}
