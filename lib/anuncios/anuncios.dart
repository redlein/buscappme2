import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AnunciosDemo extends StatelessWidget {
   AnunciosDemo({Key? key}) : super(key: key) {
    _initAd();
  }

  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;

  void _initAd() {
    var testAdUnitId;
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712", 
      request: AdRequest(), 
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded, 
        onAdFailedToLoad: (error) {}, ), ); 
  }

  void onAdLoaded(InterstitialAd ad){
    _interstitialAd = ad;
    _isAdLoaded = true;

    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback();
    onAdDismissedFullScreenContent: (ad){
      _interstitialAd.dispose();
    };
    
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('ANUNCIOS'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if(_isAdLoaded){
              _interstitialAd.show();
            }
          }, 
          child: Text ('Ver Anuncio'),
      ),
    ),);
 }
}