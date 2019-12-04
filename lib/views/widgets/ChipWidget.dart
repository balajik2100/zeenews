import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeenews/models/HomeReponseData.dart';

// ignore: must_be_immutable
class CustomChipWidget extends StatelessWidget {
  final List<Item> data;

  CustomChipWidget({@required this.data});

  List<String> litems = ["fdj", "adkjfajdfl"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int _value = 1;

    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: data
            .map(
              (item) => new Transform(
                  transform: new Matrix4.identity()..scale(0.9),
                  child: Chip(

                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    elevation: 3.0,
                    label: Text(
                      item.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    labelPadding: EdgeInsets.all(4.0),
                  )),
            )
            .toList());
  }
}
