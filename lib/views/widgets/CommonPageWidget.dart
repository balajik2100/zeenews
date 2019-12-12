import 'package:flutter/material.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/models/PhotoResponseData.dart';
import 'package:zeenews/models/VideoResponseData.dart';
import 'package:zeenews/utils/Types.dart';
import 'package:zeenews/utils/Utils.dart';
import 'package:zeenews/views/widgets/Banner_NewsListWidget.dart';
import 'package:zeenews/views/widgets/BlogWidget.dart';
import 'package:zeenews/views/widgets/BreakingWidget.dart';
import 'package:zeenews/views/widgets/ChipWidget.dart';
import 'package:zeenews/views/widgets/GalleryWidget.dart';
import 'package:zeenews/views/widgets/LogoWidget.dart';
import 'package:zeenews/views/widgets/NewsListWidget.dart';

// ignore: must_be_immutable
class CommonPageWidget extends StatefulWidget {
  PhotoResponseData photo;
  VideoResponseData video;
  String type;

  CommonPageWidget({@required this.photo,@required this.video,@required this.type});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CommonPageWidgetState();
  }
}

class _CommonPageWidgetState extends State<CommonPageWidget> {
  ScrollController _scrollController;
  double _scrollPosition;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SectionPage(context,widget.type, photoData:widget.photo);
  }

  // ignore: non_constant_identifier_names
  Widget SectionPage(BuildContext context, String type, {PhotoResponseData photoData}) {
    if (photoData != null &&
        photoData.news != null &&
        photoData.news.length > 0) {

      List<NewsDataItem> newsData = List();
      if(photoData is PhotoResponseData)
        newsData = photoData.news;


      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Container(child: getEntertainMent(newsData)),
          Container(child: getSports(newsData)),
          Container(child: getBusiness(newsData)),
        ],
      );
    } else {
      return Container(
        child: Align(alignment: Alignment.center, child: Text("No Data")),
      );
    }

  }

  underLineBoxDecoration() {
    return BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.red, width: 1.0)));
  }

  getTitleWidget(String title, bool news) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 9,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                  child: Container(
                      decoration: underLineBoxDecoration(),
                      child: Text('$title',
                          style: TextStyle(
                              color: news ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)))),
            )),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
              padding: EdgeInsets.only(
                  left: 15.0, top: 5.0, bottom: 5.0, right: 5.0),
              child: Container(child: Icon(Icons.arrow_right,color: Colors.white,))),
        )
      ],
    );
  }

  getEntertainMent(List<NewsDataItem> newsData) {
    if (newsData[0].entertainment != null &&
        newsData[0].entertainment.length > 0) {
      if (newsData[0].entertainment[0].photos != null &&
          newsData[0].entertainment[0].photos.length > 0) {
        String title =Utils.upperCase(newsData[0].entertainment[0].name);
        List<Item> sectionData = newsData[0].entertainment[0].photos;

        return Container(
            color: Colors.black,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: Column(
                  children: <Widget>[
                    getTitleWidget(title, false),
                    new Container(
                        height: 200,
                        width:MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GalleryWidget(
                                data: sectionData[index], index: index);
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: sectionData.length,
                          shrinkWrap: false,
                          // todo comment this out and check the result
                          physics:
                              ClampingScrollPhysics(), // todo comment this out and check the result
                        ))
                  ],
                )));
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  getSports(List<NewsDataItem> newsData) {
    if (newsData[0].sports != null &&
        newsData[0].sports.length > 0) {
      if (newsData[0].sports[0].photos != null &&
          newsData[0].sports[0].photos.length > 0) {
        String title = Utils.upperCase(newsData[0].sports[0].name);
        List<Item> sectionData = newsData[0].sports[0].photos;
        return Container(
            color: Colors.black,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: Column(
                  children: <Widget>[
                    getTitleWidget(title, false),
                    new Container(
                        height: 200,
                        width:MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GalleryWidget(
                                data: sectionData[index], index: index);
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: sectionData.length,
                          shrinkWrap: false,
                          // todo comment this out and check the result
                          physics:
                          ClampingScrollPhysics(), // todo comment this out and check the result
                        ))
                  ],
                )));
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  getBusiness(List<NewsDataItem> newsData) {
    if (newsData[0].business != null &&
        newsData[0].business.length > 0) {
      if (newsData[0].business[0].photos != null &&
          newsData[0].business[0].photos.length > 0) {
        String title =Utils.upperCase(newsData[0].business[0].name);
        List<Item> sectionData = newsData[0].business[0].photos;
        return Container(
            color: Colors.black,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: Column(
                  children: <Widget>[
                    getTitleWidget(title, false),
                    new Container(
                        height: 200,
                        width:MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GalleryWidget(
                                data: sectionData[index], index: index);
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: sectionData.length,
                          shrinkWrap: false,
                          // todo comment this out and check the result
                          physics:
                          ClampingScrollPhysics(), // todo comment this out and check the result
                        ))
                  ],
                )));
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }
/*
  Widget PhotoSection(BuildContext context, List<NewsData> newsData) {

    return ListView.builder(
      // ignore: missing_return
        controller: _scrollController,
        itemBuilder: (context, index) {
          if(newsData[index] is Item){
            return Container(
                color: Colors.black,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      children: <Widget>[
                        getTitleWidget(, false),
                        new Container(
                          height: 180.0,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return GalleryWidget(
                                  data: NewsData, index: index);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: item.length,
                            shrinkWrap: false,
                            // todo comment this out and check the result
                            physics:
                            ClampingScrollPhysics(), // todo comment this out and check the result
                          ),
                        ),
                      ],
                    )));
          }
          else if (newsData[index] is Entertainment){
            return Container(
                color: Colors.black,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      children: <Widget>[
                        getTitleWidget(title, false),
                        new Container(
                          height: 180.0,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return GalleryWidget(
                                  data: item[index], index: index);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: item.length,
                            shrinkWrap: false,
                            // todo comment this out and check the result
                            physics:
                            ClampingScrollPhysics(), // todo comment this out and check the result
                          ),
                        ),
                      ],
                    )));
          }

        },
        itemCount: newsData.length);

  }*/
}
