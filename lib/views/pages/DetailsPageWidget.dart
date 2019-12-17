import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zeenews/main.dart';
import 'package:zeenews/models/DetailResponseData.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/utils/RenderHtml.dart';
import 'package:zeenews/utils/Utils.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/widgets/ChipWidget.dart';
import 'package:zeenews/views/widgets/InternetConnection.dart';

class DetailsPageWidget extends StatefulWidget {
  DetailsPageWidget({this.context, this.viewModel, this.data}) : super();
  final BuildContext context;
  final MainPageViewModel viewModel;
  final Item data;

  _DetailsPageWidget createState() => _DetailsPageWidget();
}

class _DetailsPageWidget extends State<DetailsPageWidget> {
  String selectedPopupRoute = "Share";
  final List<String> popupRoutes = <String>["Share", "Comments"];

  @override
  void initState() {
    // TODO: implement initState
    loadDetailsView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: mainPageVM, child: Container(child: childWidgetModel()));
  }

  Widget detailDataWidget(DetailResponseData detailsSection) {
    return Material(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        checkItemContainsData(
                                newsdetail: detailsSection.newsdetail)
                            ? Container(
                                height: MediaQuery.of(context).size.height / 3,
                                child: Image.network(
                                    detailsSection.newsdetail != null &&
                                            detailsSection
                                                    .newsdetail.thumbnailUrl !=
                                                null
                                        ? detailsSection.newsdetail.thumbnailUrl
                                        : "",
                                    fit: BoxFit.fill),
                              )
                            : Container(),
                        Positioned(
                          top: 30,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      flex: 6,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Icon(Icons.arrow_back,
                                                  color: Colors.white)))),
                                  Expanded(
                                      flex: 4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                              width: 20,
                                              height: 20,
                                              child: GestureDetector(
                                                  onTap: () {},
                                                  child: Image.asset(
                                                    "assets/images/volumeup.png",
                                                    color: Colors.white,
                                                  ))),
                                          Container(
                                              width: 20,
                                              height: 20,
                                              child: GestureDetector(
                                                  onTap: () {},
                                                  child: Image.asset(
                                                    "assets/images/whatsapp.png",
                                                    color: Colors.white,
                                                  ))),
                                          Container(
                                              width: 20,
                                              height: 20,
                                              child: GestureDetector(
                                                  onTap: () {},
                                                  child: Image.asset(
                                                      "assets/images/tag.png",
                                                      color: Colors.white))),
                                          Container(
                                              width: 20,
                                              height: 20,
                                              child: GestureDetector(
                                                  onTap: _showDialog(
                                                      context, detailsSection),
                                                  child: Image.asset(
                                                      "assets/images/more.png",
                                                      color: Colors.white))),
                                        ],
                                      )),
                                ],
                              )),
                        )
                      ],
                    ),
                    checkItemContainsData(newsdetail: detailsSection.newsdetail)
                        ? Container(
                            padding: EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            child: Center(
                                child: Text(
                                    detailsSection.newsdetail != null &&
                                            detailsSection.newsdetail.title !=
                                                null
                                        ? detailsSection.newsdetail.title
                                        : "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black))))
                        : Container(),
                    checkItemContainsData(
                            authordetail: detailsSection.authordetail)
                        ? Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                        width: 30,
                                        height: 30,
                                        padding: EdgeInsets.all(2.0),
                                        child: Image.network(detailsSection
                                                    .authordetail[0]
                                                    .authorThumbnailUrl !=
                                                null
                                            ? detailsSection.authordetail[0]
                                                .authorThumbnailUrl
                                            : "")),
                                    Text(detailsSection
                                                .authordetail[0].author !=
                                            null
                                        ? detailsSection.authordetail[0].author
                                        : "")
                                  ],
                                ),
                                Text("|"),
                                Row(
                                  children: <Widget>[
                                    Container(
                                        width: 30,
                                        height: 30,
                                        padding: EdgeInsets.all(2.0),
                                        child: Image.network(detailsSection
                                                    .authordetail[0]
                                                    .authorThumbnailUrl !=
                                                null
                                            ? detailsSection.authordetail[0]
                                                .authorThumbnailUrl
                                            : "")),
                                    Text(detailsSection.authordetail[0].title !=
                                            null
                                        ? detailsSection.authordetail[0].title
                                        : "")
                                  ],
                                ),
                              ],
                            ))
                        : Container(),
                    checkItemContainsData(newsdetail: detailsSection.newsdetail)
                        ? Container(
                            padding: EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            child: Center(
                                child: Text(
                                    (detailsSection.newsdetail != null &&
                                            detailsSection
                                                    .newsdetail.highlights !=
                                                null)
                                        ? detailsSection.newsdetail.highlights
                                        : "",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black))))
                        : Container(),
                    checkItemContainsData(newsdetail: detailsSection.newsdetail)
                        ? Container(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                            alignment: Alignment.center,
                            child: Center(
                                child: Text(
                                    (detailsSection.newsdetail != null &&
                                            detailsSection.newsdetail.content !=
                                                null)
                                        ? detailsSection.newsdetail.content
                                        : "",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black))))
                        : Container(),
                    checkItemContainsData(tags: detailsSection.tags)
                        ? Column(
                            children: <Widget>[
                              getTitleWidget("TAGS", true),
                              Container(
                                height: 60.0,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return CustomChipWidget(
                                        tags: detailsSection.tags,
                                        type: "TAGS");
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 1,
                                  shrinkWrap: false,
                                  // todo comment this out and check the result
                                  physics:
                                      ClampingScrollPhysics(), // todo comment this out and check the result
                                ),
                              )
                            ],
                          )
                        : Container(),
                  ],
                ))));
  }

  void loadDetailsView() async {
    if (widget.data.id != null) {
      await widget.viewModel.setDetailsView(widget.data.id);
    }
  }

  childWidgetModel() {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (_, __, model) {
        return FutureBuilder<DetailResponseData>(
            future: model.detailsView,
            // ignore: missing_return
            builder: (_, AsyncSnapshot<DetailResponseData> snapshot) {
              switch (snapshot.connectionState) {
                // ignore: missing_return
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    var detailsData = snapshot.data;
                    return detailDataWidget(detailsData);
                  } else if (snapshot.hasError) {
                    return Align(
                      alignment: Alignment.center,
                      child: InternetConnection(
                        action: () async {
                          if (widget.data.id != null) {
                            await widget.viewModel
                                .setDetailsView(widget.data.id);
                          }
                        },
                      ),
                    );
                  } else {
                    return Align(
                        alignment: Alignment.center,
                        child: Text("Coming Soon"));
                  }
              }
            });
      },
    );
  }

  _showDialog(BuildContext context, DetailResponseData detailsSection) {
    return () async {
      String selected = await showMenu<String>(
        context: context,
        initialValue: selectedPopupRoute,
        position: new RelativeRect.fromLTRB(MediaQuery.of(context).size.width,
            150.0, 10.0, MediaQuery.of(context).size.height),
        items: popupRoutes.map((String popupRoute) {
          return new PopupMenuItem<String>(
            child: new Text(popupRoute),
            value: popupRoute,
          );
        }).toList(),
      );
      if (selected != null) {
        setState(() {
          selectedPopupRoute = selected;
        });
        if (selectedPopupRoute == "Share") Utils.share(context, detailsSection);
        if (selectedPopupRoute == "Comments") print("wait");
      }
    };
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
      ],
    );
  }

  underLineBoxDecoration() {
    return BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.red, width: 1.0)));
  }

  bool checkItemContainsData(
      {List<Breadcrumb> breadcrumb,
      Newsdetail newsdetail,
      List<Authordetail> authordetail,
      List<Tags> tags,
      List<List> nextArticles,
      String value}) {
    bool itemData = false;
    bool itemValue = false;

    if (breadcrumb != null && breadcrumb.length > 0) itemData = true;
    if (newsdetail != null) itemData = true;
    if (authordetail != null && authordetail.length > 0) itemData = true;
    if (tags != null && tags.length > 0) itemData = true;
    if (value != null) itemValue = true;

    if (itemData) {
      return true;
    } else {
      return false;
    }
  }
  Future<void> loadHtmlFromAssets(String text, controller) async {
    controller.loadUrl(Uri.dataFromString(text.toString().trim(), mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
  }
}
