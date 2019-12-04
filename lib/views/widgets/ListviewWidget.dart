import 'package:flutter/material.dart';
import 'package:zeenews/models/LanguageResponseData.dart';

// ignore: must_be_immutable
class ListviewWidget extends StatelessWidget {
  Langauages language;
  BuildContext context;

  ListviewWidget({@required this.language, @required this.context});

  @override
  Widget build(BuildContext context) {
    var bannerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 0.2,
                  color: Colors.grey //                   <--- border width here
                  ),
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(language.thumbnailUrl,
                    height: 50.0, width: 80.0, fit: BoxFit.fill),
                Text(
                  language.regTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                )
              ],
            ))
      ],
    );
    // TODO: implement build
    return bannerWidget;
  }
}
