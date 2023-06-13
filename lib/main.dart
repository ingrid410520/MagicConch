
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('마법의 소라고둥 : 결정장애 브레이커'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('아무말 대잔치'),
            Text('룰렛 돌리기'),
            Text('폭탄 돌리기'),
            Text('만든이'),
          ],
        ),
      ),
    );
  }
}
