
// import 'package:HealthSex/ad_helper/ad_helper.dart';
// import 'package:HealthSex/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthysex/subjects.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_){
    runApp(MyApp());
  });
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'الثقافة الجنسية',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.white),
      ),
      home: const MyHomePage(title: 'الثقافة الجنسية'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

// // TODO: Add _bannerAd
//   BannerAd _bannerAd;
//
//   // TODO: Add _isBannerAdReady
//   bool _isBannerAdReady = false;
@override
void initState() {
  // // TODO: Initialize _bannerAd
  // _bannerAd = BannerAd(
  //   adUnitId: AdHelper.bannerAdUnitId,
  //   request: AdRequest(),
  //   size: AdSize.banner,
  //   listener: BannerAdListener(
  //     onAdLoaded: (_) {
  //       setState(() {
  //         _isBannerAdReady = true;
  //       });
  //     },
  //     onAdFailedToLoad: (ad, err) {
  //       _isBannerAdReady = false;
  //       ad.dispose();
  //     },
  //   ),
  // );
  //
  // _bannerAd.load();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      // Stack(
      // children: [
        Scaffold(
          backgroundColor: Colors.pinkAccent,
          body:
         Subjects()
        );
    //     if (_isBannerAdReady)
    // Align(
    //   alignment: Alignment.bottomCenter,
    //   child: Container(
    //     width: _bannerAd.size.width
    //         .toDouble(),
    //     height: _bannerAd.size.height
    //         .toDouble(),
    //     child: AdWidget(ad: _bannerAd),
    //   ),
    // ),


    //   ],
    // );
  }
}