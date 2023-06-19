
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_conch/Screen/Anyword.dart';
import 'package:magic_conch/Screen/AnywordSetting.dart';

import 'Screen/Home.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "마법의 소라에몬",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      //darkTheme: ThemeData.light(),
      //darkTheme: ThemeData.dark(),
      //themeMode: ThemeMode.system,
      routes: {
        '/home': (context) => AppHome(),
        '/anyword' : (context) => Screen_Anyword(),
        '/anyword_setting' : (context) => Screen_AnywordSetting(),

      },
      initialRoute: '/home',
    );;
  }
}
