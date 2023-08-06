import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:magic_conch/Data/DataManager.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import 'package:magic_conch/Function/Button_Homemenu.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  late BannerAd? _bannerAd;
  bool _isLoaded = false;

  // TODO: replace this test ad unit with your own ad unit.
  final AdSize adSize = AdSize(height: 50, width: 300);
  final adUnitId = 'ca-app-pub-3940256099942544/6300978111';

  //final adUnitId = 'ca-app-pub-3940256099942544/2934735716';

  // final adUnitId = Platform.isAndroid
  //     ? 'ca-app-pub-8087572867617685~8829685701'
  //     : 'ca-app-pub-8087572867617685/8245293978';

  /// Loads a banner ad.
  void loadAd() {
    print("AD Test Start $adUnitId");
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received. << 여기서 문제 발생
        onAdLoaded: (ad) {
          debugPrint('AD Test Loading. $ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    loadAd();
    Future<bool> bDataLoad_Anyword = DataManager().Load_Anyword();
    bDataLoad_Anyword.then((value) {
      if (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Load done - Anyword")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Load fail - Anyword Initialized")));
      }
    }).catchError((error) => print('error: $error'));

    MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
        testDeviceIds: ['33BE2250B43518CCDA7DE426D04EE231']));

    return BuildMyScreen(
      strTitle: '마법의 소라에몬 : 결정장애 브레이커',
      widBody: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 3,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Image.asset('assets/images/pixelsora.png')),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button_Home(
                      strName: "아무말 대잔치",
                      ButtonFunction: () {
                        Navigator.pushNamed(context, DataManager().Screen_Anyword);
                      }),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button_Home(
                        strName: "룰렛 돌리기 (테스트 필드)",
                        ButtonFunction: () {
                          Navigator.pushNamed(context, '/testfiled');
                        }),
                  )),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button_Home(
                        strName: "폭탄 돌리기 (준비중)", ButtonFunction: () {}),
                  )),
              buildBannerAD(),
              // Expanded(
              //     flex: 1,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Button_Home(
              //           strName: "만든이 (준비중)", ButtonFunction: () {}),
              //     )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBannerAD() {
    if (_bannerAd != null) {
      print("AD Test _bannerAd : NULL");
    }
    return Flexible(
        child: Container(
      color: Colors.white,
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    ));
  }
}
