import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class RenderHtml extends StatelessWidget {
  String data;
  RenderHtml({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Render HTML example')),
      body: Center(
        child: SingleChildScrollView(
          child: Html(padding: EdgeInsets.all(12.0),
              data:""+ data+""),
        ),
      ),
    );
  }
}