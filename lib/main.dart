
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      title: "결정장애 브레이커",
      routes: {
        '/home': (context) => AppHome(),

      },
      initialRoute: '/home',
    );
  }
}
