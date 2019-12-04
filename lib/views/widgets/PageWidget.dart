
import 'package:flutter/material.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/services/ZeeAPIService.dart';
import 'package:zeenews/utils/Types.dart';
import 'package:zeenews/utils/Utils.dart';
import 'package:zeenews/views/widgets/Banner_NewsListWidget.dart';
import 'package:zeenews/views/widgets/BlogWidget.dart';
import 'package:zeenews/views/widgets/ChipWidget.dart';
import 'package:zeenews/views/widgets/GalleryWidget.dart';
import 'package:zeenews/views/widgets/LogoWidget.dart';
import 'package:zeenews/views/widgets/NewsListWidget.dart';

// ignore: must_be_immutable
class PageWidget extends StatelessWidget{
  List<BaseSection> homeData;
  PageWidget({@required this.homeData});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SectionPage(context,homeData);
  }

  // ignore: non_constant_identifier_names
  Widget SectionPage(BuildContext context, List<BaseSection> homeData) {
    return ListView.builder(
      // ignore: missing_return
        itemBuilder: (context, index) {

          if (homeData[index].type == Types.NEWS) {
            List<Item> item = homeData[index].data;
            String title = "";
            if ((homeData[index]).title.contains("regional-langauge")) {
              title = Utils.upperCase((homeData[index]).name);
            } else {
              title = Utils.upperCase((homeData[index]).title);
            }
            if(title=="TOP NEWS"){
                return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Banner_NewsWidget(
                            data: item[index], index: index,sectiontitle:title);
                      },
                      itemCount: item.length,
                      shrinkWrap: true,
                      // todo comment this out and check the result
                      physics:
                      ClampingScrollPhysics(), // todo comment this out and check the result
                    ),
                  ],
                ),
              );
            }
            else{
                return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: <Widget>[
                    getTitleWidget(title,true)
                    ,
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return NewsWidget(
                            data: item[index], index: index);
                      },
                      itemCount: item.length,
                      shrinkWrap: true,
                      // todo comment this out and check the result
                      physics:
                      ClampingScrollPhysics(), // todo comment this out and check the result
                    ),
                  ],
                ),
              );
            }

          }
          else if (homeData[index].type == Types.SECTION_MENU) {
            List<Item> item = homeData[index].data;
            String title = "";
            if ((homeData[index]).title.contains("regional-langauge")) {
              title = Utils.upperCase((homeData[index]).name);
            } else {
              title = Utils.upperCase((homeData[index]).title);
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Banner_NewsWidget(
                          data: item[index], index: index,sectiontitle:title);
                    },
                    itemCount: item.length,
                    shrinkWrap: true,
                    // todo comment this out and check the result
                    physics:
                    ClampingScrollPhysics(), // todo comment this out and check the result
                  ),
                ],
              ),
            );


          }

          else if (homeData[index].type ==  Types.PHOTO_GALLERY ||   homeData[index].type == Types.VIDEOS) {
            List<Item> item = homeData[index].data;
            String title = Utils.upperCase((homeData[index]).title);
              return Container(
                color: Colors.black,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      children: <Widget>[
                        getTitleWidget(title,false),
                        new Container(
                          height: 180.0,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return GalleryWidget(
                                  data: item[index],
                                  index: index);
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

          else if (homeData[index].type == Types.LIVE) {
            List<Item> item = homeData[index].data;
            String title = Utils.upperCase((homeData[index]).title);
              return Container(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      children: <Widget>[
                        getTitleWidget(title,true),
                        new Container(
                          height: 80.0,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return LiveWidget(
                                  data: item[index],
                                  index: index);
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


          else if (homeData[index].type == Types.BLOG) {
            List<Item> item = homeData[index].data;
            String title =
            Utils.upperCase((homeData[index]).title);
              return Container(
                color: Colors.black,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      children: <Widget>[
                        getTitleWidget(title,false),
                        new Container(
                          height: 120.0,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return BlogWidget(
                                  data: item[index],
                                  index: index);
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

          else if (homeData[index].type ==Types.CHIPVIEW) {
            List<Item> item = homeData[index].data;
            String title =  Utils.upperCase((homeData[index]).title);
              return Container(
                color: Colors.black,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      children: <Widget>[
                        getTitleWidget(title,false),
                        new Container(
                          height: 60.0,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CustomChipWidget(
                                data: item,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
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
        itemCount: homeData.length);
  }


  underLineBoxDecoration() {
    return BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.red, width: 1.0)));
  }

  getTitleWidget(String title,bool news) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 9,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 15.0,top: 5.0,bottom: 5.0),
                  child: Container(
                      decoration: underLineBoxDecoration(),
                      child: Text('$title',
                          style: TextStyle(
                              color:news?Colors.black:Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)))),
            )
        )
        ,
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
              padding: EdgeInsets.only(left: 15.0,top: 5.0,bottom: 5.0,right: 5.0),
              child: Container(
                  child: Icon(Icons.arrow_right)
              )),
        )
      ],);
  }
}