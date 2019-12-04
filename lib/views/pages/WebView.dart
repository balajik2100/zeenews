import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:webview_flutter/webview_flutter.dart';


class LoadWebPage extends StatefulWidget{

  final String title;
  final String selectedUrl;

  LoadWebPage({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadWebPage();
  }
}

class _LoadWebPage extends State<LoadWebPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: WebView(
          initialUrl:widget.selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) async {
            _makeGetRequest(webViewController,widget.selectedUrl);
          },
        )
    );
  }

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    controller.loadUrl(Uri.dataFromString(filename.toString().trim(), mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
  }

  _makeGetRequest(WebViewController webViewController, String selectedUrl) async {
    Response response = await get(selectedUrl);
   // int statusCode = response.statusCode;
   // Map<String, String> headers = response.headers;
    var data = json.decode(response.body);
    var webData = data["content"];
    print("WEBPAGE DATA:"+webData);
    loadHtmlFromAssets(webData, webViewController);

  }
}
