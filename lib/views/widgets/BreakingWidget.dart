import 'package:flutter/material.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';

class BreakingWidget extends StatefulWidget {
  final Item data;
  final int index;

  BreakingWidget({@required this.index, @required this.data});

  @override
  _BreakingWidgetState createState() => _BreakingWidgetState();
}

class _BreakingWidgetState extends State<BreakingWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: new MarqueeWidget(
        text: widget.data?.title != null ? widget.data?.title : "",
        textStyle: new TextStyle(fontSize: 16.0,color: Colors.black),
        scrollAxis: Axis.horizontal,
      ),
    );
  }
}
