import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeenews/models/DetailResponseData.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/views/pages/DetailsPageWidget.dart';

import '../../main.dart';

// ignore: must_be_immutable
class CustomChipWidget extends StatelessWidget {
  final List<Item> data;
  final List<Tags> tags;
  final String type;

  CustomChipWidget({@required this.data, @required this.tags,@required this.type});

  List<String> litems = ["fdj", "adkjfajdfl"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int _value = 1;

    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: chipWidget());
  }

  chipWidget() {
    if (type=="CHIP"){
      return data
          .map(
            (item) => new Transform(
            transform: new Matrix4.identity()..scale(0.9),
            child: GestureDetector(
                onTap: () {
                  /*Navigator.of(context).push(MaterialPageRoute( builder: (context) => DetailsPageWidget(context:context,viewModel: mainPageVM,data: item)));*/
                },
                child: Chip(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  elevation: 3.0,
                  label: Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  labelPadding: EdgeInsets.all(4.0),
                ))),
      )
          .toList();
    }
    if(type=="TAGS"){
      return tags
          .map(
            (item) => new Transform(
            transform: new Matrix4.identity()..scale(0.9),
            child: GestureDetector(
                onTap: () {
                  /*Navigator.of(context).push(MaterialPageRoute( builder: (context) => DetailsPageWidget(context:context,viewModel: mainPageVM,data: item)));*/
                },
                child: Chip(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  elevation: 3.0,
                  label: Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  labelPadding: EdgeInsets.all(4.0),
                ))),
      )
          .toList();
    }

  }

}
