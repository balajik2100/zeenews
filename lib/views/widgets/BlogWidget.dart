import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';

class BlogWidget extends StatelessWidget {
  final Item data;
  final int index;

  BlogWidget({@required this.data, @required this.index});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      data.title,
      maxLines: 2,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: CustomFontStyle.APP_BLOG_TXT_SIZE,

      ),
    );

    return Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(left: 5.0, right: 5.0),
        child:GestureDetector(onTap: (){},child:  Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
                top: 15.0,
                child: Center(
                  child: Container(
                      width: 200.0,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.white),
                      child:Center(child:Padding(padding: EdgeInsets.all(3.0), child:Align(alignment: Alignment.center,child: title)))),
                )),
            Column(
              children: <Widget>[
                Container(
                  width: 200.0,
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(data.thumbnailUrl)))),
                )
              ],
            )
          ],
        )));
  }
}
