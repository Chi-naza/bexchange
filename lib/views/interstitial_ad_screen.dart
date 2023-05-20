import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';



class InterstitialAdScreen extends StatefulWidget {
  const InterstitialAdScreen({super.key});

  @override
  InterstitialAdScreenState createState() => InterstitialAdScreenState();
}

class InterstitialAdScreenState extends State<InterstitialAdScreen> {
  InterstitialAd? _interstitialAd;
  final _gameLength = 3;
  late var _counter = _gameLength;

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';

  @override
  void initState() {
    super.initState();

    _startNewGame();
  }

  void _startNewGame() {
    setState(() => _counter = _gameLength);

    _loadAd();
    _starTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('My Ads'),
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'The BeXchange Adds',
                      style:
                          TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${_counter.toString()} seconds left!'),
                      Visibility(
                        visible: _counter == 0,
                        child: TextButton(
                          onPressed: () {
                            _startNewGame();
                          },
                          child: const Text('Load Again'),
                        ),
                      )
                    ],
                  )),
            ],
          ));
  }

  /// Loads an interstitial ad.
  void _loadAd() {
    InterstitialAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (InterstitialAd ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});

            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Press OK'),
              content: Text('Load the ad by pressing okay'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _interstitialAd?.show();
                  },
                  child: const Text('OK'),
                )
              ],
            ));
  }

  void _starTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _counter--);

      if (_counter == 0) {
        _showAlert(context);
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }
}