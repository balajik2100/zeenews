import 'package:flutter/material.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';
import 'package:zeenews/views/pages/DetailsPageWidget.dart';

import '../../main.dart';

class NewsWidget extends StatefulWidget {
  final Item data;
  final int index;

  NewsWidget(
      {@required this.index, @required this.data});

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var title = Text(
      widget.data?.title!=null?widget.data?.title:"",
      maxLines: 2,
      style: TextStyle(
        color: CustomColors.SECTION_TITLE_TXT_COLOR,
        fontSize: CustomFontStyle.SECTION_TITLE_SIZE,
      ),
    );

    var subTitle = Text(
      widget.data?.highlights!=null?widget.data?.highlights:"",
      maxLines: 3,
      style: TextStyle(
          color: CustomColors.SECTION_SUB_TITLE_TXT_COLOR,
          fontSize: CustomFontStyle.SECTION_SUBTITLE_SIZE),
    );

    var sectionMenuWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0, bottom: 4.0),
            color: Colors.white,
            child:GestureDetector(onTap: (){
              if(widget.data!=null && widget.data.id!=null)
                Navigator.of(context).push(MaterialPageRoute( builder: (context) => DetailsPageWidget(context:context,viewModel: mainPageVM,data: widget.data)));
            },child:
            Card(
              elevation: 3.0,
              child: Row(children: <Widget>[
                Expanded(
                    flex: 6,
                    child: ListTile(
                      title: title,
                      subtitle: subTitle,
                    )),
                Expanded(
                  flex: 4,
                  child:Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        )),
                    child: Image.network(
                      widget.data.thumbnailUrl!=null?widget.data?.thumbnailUrl:"",
                      width: 250,
                      fit: BoxFit.contain,
                    ),
                  ),

                ),
              ]),
            )))
      ],
    );
    return sectionMenuWidget;
  }
}

