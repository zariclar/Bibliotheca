import 'dart:async';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class ReadBook extends StatefulWidget {
  final String ReadUrl;
  final String title;

  ReadBook(this.ReadUrl, this.title);
  @override
  _HomePageState createState() => _HomePageState(ReadUrl, title);
}

class _HomePageState extends State<ReadBook> {
  final String url;
  String pdfasset = "assets/sample.pdf";
  final String title;
  bool _loading = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  _HomePageState(this.url, this.title);

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    //final doc = await PDFDocument.fromURL(url);
    
    setState(() {    
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : WebView(
              initialUrl: url,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              zoomEnabled: true,
            ),
      /*PDFViewer(
              document: _doc,
              indicatorBackground: Colors.red,
              // showIndicator: false,
              // showPicker: false,
            ),*/
    );
  }
}
