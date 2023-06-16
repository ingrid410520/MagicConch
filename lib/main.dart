
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_conch/Screen/Anyword.dart';

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
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => AppHome(),
        '/anyword' : (context) => Screen_Anyword(),

      },
      initialRoute: '/home',
    );
  }
}
