import 'package:flutter/material.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/models/PhotoResponseData.dart';
import 'package:zeenews/utils/Utils.dart';
import 'package:zeenews/views/widgets/GalleryWidget.dart';

class AlbumGalleryWidget extends StatelessWidget {
  List<NewsDataItem> newsdata;

  AlbumGalleryWidget({@required this.newsdata});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GallerySection(newsdata, context);
  }

  Widget GallerySection(List<NewsDataItem> newsData, BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        Container(child: getEntertainMent(newsData, context)),
        Container(child: getSports(newsData, context)),
        Container(child: getBusiness(newsData, context)),
        Container(child: getDna(newsData, context)),
      ],
    );
  }

  getTitleWidget(String title, bool news, BuildContext context) {
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
              child: Container(
                  child: Icon(Icons.arrow_forward,color: Colors.red))),
        )
      ],
    );
  }

  getEntertainMent(List<NewsDataItem> newsData, BuildContext context) {
    if (newsData[0].entertainment != null &&
        newsData[0].entertainment.length > 0) {
      if (newsData[0].entertainment[0].photos != null &&
          newsData[0].entertainment[0].photos.length > 0) {
        String title = Utils.upperCase(newsData[0].entertainment[0].name);
        List<Item> sectionData = newsData[0].entertainment[0].photos;
        return DisplaySectionGallery(sectionData, title, context);
      } else if (newsData[0].entertainment[0].videos != null &&
          newsData[0].entertainment[0].videos.length > 0) {
        String title = Utils.upperCase(newsData[0].entertainment[0].name);
        List<Item> sectionData = newsData[0].entertainment[0].videos;
        return DisplaySectionGallery(sectionData, title, context);
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  getSports(List<NewsDataItem> newsData, BuildContext context) {
    if (newsData[0].sports != null && newsData[0].sports.length > 0) {
      if (newsData[0].sports[0].photos != null &&
          newsData[0].sports[0].photos.length > 0) {
        String title = Utils.upperCase(newsData[0].sports[0].name);
        List<Item> sectionData = newsData[0].sports[0].photos;
        return DisplaySectionGallery(sectionData, title, context);
      } else if (newsData[0].sports[0].videos != null &&
          newsData[0].sports[0].videos.length > 0) {
        String title = Utils.upperCase(newsData[0].sports[0].name);
        List<Item> sectionData = newsData[0].sports[0].videos;
        return DisplaySectionGallery(sectionData, title, context);
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  getBusiness(List<NewsDataItem> newsData, BuildContext context) {
    if (newsData[0].business != null && newsData[0].business.length > 0) {
      if (newsData[0].business[0].photos != null &&
          newsData[0].business[0].photos.length > 0) {
        String title = Utils.upperCase(newsData[0].business[0].name);
        List<Item> sectionData = newsData[0].business[0].photos;
        return DisplaySectionGallery(sectionData, title, context);
      } else if (newsData[0].business[0].videos != null &&
          newsData[0].business[0].videos.length > 0) {
        String title = Utils.upperCase(newsData[0].business[0].name);
        List<Item> sectionData = newsData[0].business[0].videos;
        return DisplaySectionGallery(sectionData, title, context);
      }else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  getDna(List<NewsDataItem> newsData, BuildContext context) {
    if (newsData[0].dna != null && newsData[0].dna.length > 0) {
      if (newsData[0].dna[0].photos != null &&
          newsData[0].dna[0].photos.length > 0) {
        String title = Utils.upperCase(newsData[0].dna[0].name);
        List<Item> sectionData = newsData[0].dna[0].photos;
        return DisplaySectionGallery(sectionData, title, context);
      } else if (newsData[0].dna[0].videos != null &&
          newsData[0].dna[0].videos.length > 0) {
        String title = Utils.upperCase(newsData[0].dna[0].name);
        List<Item> sectionData = newsData[0].dna[0].videos;
        return DisplaySectionGallery(sectionData, title, context);
      }else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  underLineBoxDecoration() {
    return BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.red, width: 1.0)));
  }

  DisplaySectionGallery(
      List<Item> sectionData, String title, BuildContext context) {
    return Container(
        color: Colors.black,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: Column(
              children: <Widget>[
                getTitleWidget(title, false, context),
                new Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GalleryWidget(data: sectionData[index], index: index,from:"album");
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: sectionData.length,
                      shrinkWrap: false,
                      // todo comment this out and check the result
                      physics:
                          ClampingScrollPhysics(), // todo comment this out and check the result
                    ))
              ],
            )
        )
    );
  }
}
