import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';

class AdsManager {
  static bool _testMode = true;//change it when i put app on play store

  ///
  static String get appId {//id of all app
    if (Platform.isAndroid) { // if app work on android
      return "ca-app-pub-5966280928924344~3545633466";
    } else if (Platform.isIOS) {// if app work on ios
      return "ca-app-pub-5966280928924344~7758294924";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {//for ad in the bottom
    if (_testMode == true) {//if test is activate return test ad
      return AdmobBanner.testAdUnitId;
    } else if (Platform.isAndroid) {
      return "ca-app-pub-5966280928924344/2052233174";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5966280928924344/8782428521";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (_testMode == true) {
      return AdmobInterstitial.testAdUnitId;
    } else if (Platform.isAndroid) {
      return "ca-app-pub-5966280928924344/7397248564";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5966280928924344/2493541713";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAdUnitId {
    if (_testMode == true) {
      return "ca-app-pub-5966280928924344~3545633466";
    } else if (Platform.isAndroid) {
      return "ca-app-pub-5966280928924344/6235020768";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5966280928924344/7171153327";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

}