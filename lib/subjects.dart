import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:healthysex/ad_helper/ad_helper.dart';
import 'package:healthysex/launch_screen.dart';
import 'package:healthysex/lists_constants.dart';


class Subjects extends StatefulWidget {
  Subjects({Key key}) : super(key: key);

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  int _selectedIndex; // if you want to provide default selection, init here
  // TODO: Add _bannerAd
  BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;

// TODO: Add _interstitialAd
  InterstitialAd _interstitialAd;
  // TODO: Implement _loadInterstitialAd()
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.show();
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void initState() {
    _loadInterstitialAd();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.015),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width, // play with height
                  height:
                      MediaQuery.of(context).size.width * 0.450, // play with height
                  child: Stack(
                    children: [
                      GridView.builder(
                        itemCount: TITLES.length,
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                _interstitialAd?.show();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LaunchScreen(index)));
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 800,
                                  height: 200,
                                  // play with height
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: _selectedIndex == index
                                        ? Colors.blue
                                        : Colors.white,
                                  ),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Image.asset(
                                            IMAGES.elementAt(index),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Text(TITLES.elementAt(index),
                                                  style: const TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 24,
                                                      overflow: TextOverflow.fade,
                                                      fontWeight: FontWeight.w700)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        },
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (1),
                        ),
                      ),
                      if (_isBannerAdReady)
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: _bannerAd.size.width.toDouble(),
                            height: _bannerAd.size.height.toDouble(),
                            child: AdWidget(ad: _bannerAd),
                          ),
                        ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
