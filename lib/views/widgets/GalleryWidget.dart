import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';
import 'package:zeenews/views/pages/DetailsPageWidget.dart';

import '../../main.dart';

class GalleryWidget extends StatelessWidget {
  final Item data;
  final int index;

  GalleryWidget({@required this.data, @required this.index});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      data?.title!=null?data.title:"",
      maxLines: 3,
      style: TextStyle(
        color: Colors.black,
        fontSize: CustomFontStyle.SECTION_TITLE_SIZE,
      ),
    );

    var verticallist = Container(
        height: 140.0,
        width: 200.0,
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: roundedCornerDecoration(),
        child:GestureDetector(onTap: (){ Navigator.of(context).push(MaterialPageRoute( builder: (context) => DetailsPageWidget(context:context,viewModel: mainPageVM,data: data)));},child:  Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                        //color: Colors.black,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(topLeft:  Radius.circular(8.0),topRight:  Radius.circular(8.0)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(data.thumbnailUrl!=null?data.thumbnailUrl:"",
                              fit: BoxFit.fill),
                        )),
                    /*data.timestamp != null
                        ? Positioned(
                            top: 40,
                            child: Text(
                              data.timestamp,
                              style: TextStyle(backgroundColor: Colors.red),
                            ),
                          )
                        : Text("")*/
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(top: 2.0,left: 3.0),
                    alignment: Alignment.center,
                    child: title)
              ],
            ))));

    return verticallist;
  }

  roundedCornerDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.white);
  }
}
