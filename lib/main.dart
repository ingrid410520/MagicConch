
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:magic_conch/Screen/Anyword.dart';
import 'package:magic_conch/Screen/AnywordSetting.dart';
import 'package:magic_conch/Screen/Screen_ADtest.dart';
import 'Screen/Home.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        //'/testfiled' : (context) => TestFeild(),
        '/testfiled' : (context) => Screen_ADtest(),

      },
      initialRoute: '/home',
    );
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }
}
