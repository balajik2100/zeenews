import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeenews/models/HomeReponseData.dart';

class ScoreCardWidget extends StatelessWidget {
  final ScoreCard data;
  final int index;

  ScoreCardWidget({@required this.data, @required this.index});

  @override
  Widget build(BuildContext context) {
    var verticallist = Container(
        height: 80.0,
        width: 350.0,
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: roundedCornerDecoration(),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: Text(data.title!=null?data.title:"")),
            Container(
              padding: EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly  ,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          child: Column(
                        children: <Widget>[
                          Container(width: 30,height: 30,child: Image.asset("assets/images/twitter.png"),),
                          Text(
                            "AUS",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                      Container(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[Text("287/9",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 16)), Text("50 ovs")],
                          ))
                    ],
                  ),
                  Text("VS"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[Text("496/9",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 16),), Text("50 ovs")],
                          )),
                      Container(
                          child: Column(
                            children: <Widget>[
                              Container(width: 30,height: 30,child: Image.asset("assets/images/youtube.png"),),
                              Text(
                                "IND",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),

                            ],
                          )),

                    ],
                  ),

                ],
              ),
            ),
            Text("(100.3 over,target 459) India won by 208 runs"),
          ],
        ));

    return verticallist;
  }

  roundedCornerDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.white);
  }
}
