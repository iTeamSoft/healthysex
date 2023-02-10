import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthysex/lists_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';


class LaunchScreen extends StatefulWidget {
   const LaunchScreen(this.i, {Key key}) : super(key: key) ;
  final int  i;
  @override
  LaunchScreenState createState() {
    return LaunchScreenState();
  }
}

class LaunchScreenState extends State<LaunchScreen> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.03),
      child: WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _loadHtmlFromAssets();
        },
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString(LINKS.elementAt(widget.i));
    _controller.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }
}