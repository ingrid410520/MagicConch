import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8087572867617685~4018223050';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8087572867617685/9218099912';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return '<YOUR_ANDROID_INTERSTITIAL_AD_UNIT_ID>';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return '<YOUR_ANDROID_REWARDED_AD_UNIT_ID>';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_REWARDED_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}