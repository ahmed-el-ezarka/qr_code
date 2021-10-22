import 'package:QRScanner/adsManager.dart';
import 'package:QRScanner/test.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_native_admob/native_admob_options.dart';

import 'QR Generator/QRGenerator.dart';
import 'QR Scanner/ScanQR.dart';

class MyHomePage extends StatefulWidget {

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _nativeAdController = NativeAdmobController();

  // Language _language = Language();
//static const adUnitID="ca-app-pub-5966280928924344/6235020768";
  AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;

  @override
  void initState() {
    super.initState();

    //Ads
    interstitialAd = AdmobInterstitial(
      adUnitId: AdsManager.interstitialAdUnitId,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
      },
    );

    interstitialAd.load();
    _nativeAdController.reloadAd(forceRefresh: true);
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    _nativeAdController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text('Scanner app'),
        ),
      ),
      body: Container(
        height: (MediaQuery.of(context).size.height),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: (MediaQuery.of(context).size.height) -
                    AppBar().preferredSize.height -
                    kToolbarHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _nativeAdContainer(),
                SizedBox(height: 10,),
                Image.asset('assets/images/scan.jpg'),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: "Scan QR",
                      child: Container(
                        width: ((MediaQuery.of(context).size.width) / 2) - 45,
                        height: 50,
                        child: OutlineButton(
                          focusColor: Colors.red,
                          highlightColor: Colors.blue,
                          hoverColor: Colors.lightBlue[100],
                          splashColor: Colors.blue,
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.blue,
                          ),
                          shape: StadiumBorder(),
                          child: Text(
                            "Scan QR",
                            style: TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScanQR()));
                            interstitialAd.show();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: ((MediaQuery.of(context).size.width) / 2) - 45,
                      height: 50,
                      child: OutlineButton(
                        focusColor: Colors.red,
                        highlightColor: Colors.blue,
                        hoverColor: Colors.lightBlue[100],
                        splashColor: Colors.blue,
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.blue,
                        ),
                        shape: StadiumBorder(),
                        child: Text(
                          "Generate QR",
                          style: TextStyle(fontSize: 17),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRGenerator()));
                          interstitialAd.show();
                        },
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                _bannerAd(),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget _nativeAdContainer() {
    return Container(
      height: 250,
      child: NativeAdmob(
        adUnitID: "ca-app-pub-3940256099942544/2247696110",  //your ad unit id
        loading: Center(child: CircularProgressIndicator()),
        error: Text("Failed to load the ad"),
        controller: _nativeAdController,
        type: NativeAdmobType.full,
        options: NativeAdmobOptions(
          ratingColor: Colors.red,
          showMediaContent: true,
          callToActionStyle: NativeTextStyle(
              color: Colors.red,
              backgroundColor: Colors.black
          ),
          headlineTextStyle: NativeTextStyle(
            color: Colors.blue,
          ),

          // Others ...
        ),
      ),
    );
  }



  Widget _bannerAd() {
    return AdmobBanner(
      adUnitId: AdsManager.bannerAdUnitId,
      adSize: AdmobBannerSize.BANNER,
    );
  }
}
