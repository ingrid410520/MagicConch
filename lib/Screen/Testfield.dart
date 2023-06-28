import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import 'package:magic_conch/Function/File_Function.dart';
import 'package:magic_conch/ad_helper.dart';
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
  BannerAd? _bannerAd;
  @override
  void initState() {
    // TODO: Load a banner ad
    // BannerAd(
    //   adUnitId: AdHelper.bannerAdUnitId,
    //   request: AdRequest(),
    //   size: AdSize.banner,
    //   listener: BannerAdListener(
    //     onAdLoaded: (ad) {
    //       setState(() {
    //         _bannerAd = ad as BannerAd;
    //       });
    //     },
    //     onAdFailedToLoad: (ad, err) {
    //       print('Failed to load a banner ad: ${err.message}');
    //       ad.dispose();
    //     },
    //   ),
    // ).load();
  }

  void dispose() {
    // TODO: Dispose a BannerAd object
    _bannerAd?.dispose();
    super.dispose();
  }

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
                  // TODO: Display a banner when ready
                  if (_bannerAd != null)
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: _bannerAd!.size.width.toDouble(),
                        height: _bannerAd!.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd!),
                      ),
                    ),
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
