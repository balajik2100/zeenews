

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeenews/models/HomeReponseData.dart';

class LiveWidget extends StatelessWidget {

  final Item data;
  final int index;

  LiveWidget({@required this.data, @required this.index});

  @override
  Widget build(BuildContext context) {
    var verticallist = Container(
        height: 100.0,
        width: 160,
        color: Colors.white,
        child:
        Padding(
            padding: EdgeInsets.all(3.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                  child: Image.network(
                    data.thumbnailUrl,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            )));

    return verticallist;
  }
}
