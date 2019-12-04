import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeenews/models/HomeReponseData.dart';

class BannerWidget extends StatelessWidget {
  final Item data;

  BannerWidget({@required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            child: Stack(
              children: <Widget>[
                Image.network(data.thumbnailUrl,
                    height: 160.0, width: size.width, fit: BoxFit.fill),
                Container(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Center(
                      child: Text(data.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold))),
                )
              ],
            )),
      ],
    );
    // TODO: implement build
    return bannerWidget;
  }
}
