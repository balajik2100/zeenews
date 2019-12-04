import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zeenews/models/LanguageResponseData.dart';
import 'package:zeenews/models/SectionResponseData.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/pages/CardsListView.dart';
import 'package:zeenews/views/pages/SectionListPage.dart';
import 'package:zeenews/views/pages/WebView.dart';
import 'package:zeenews/views/widgets/InternetConnection.dart';

class Hamburger extends StatefulWidget {
  final MainPageViewModel viewModel;
  final List<Sections> sections;

  Hamburger({Key key, @required this.viewModel, @required this.sections})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HamburgerState();
  }
}

class HamburgerState extends State<Hamburger> {
  final List<String> getSetting = [
    'Contact Us',
    'Privacy Policy',
    'Complaint',
    'Legal Disclaimer',
    'Investor Info',
    'Advertise With Us',
    'Careers',
    'Where to Watch'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        /*   DrawerHeader(
            child: UserAccountsDrawerHeader(
              accountName: Text("User_Name"),
              accountEmail: Text("User_Email@zee.esselgroup.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
          ),*/

        ListView.builder(
            itemCount: widget.sections != null ? widget.sections.length : 0,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext ctxt, int index) {
              if (widget.sections[index].subSections is String) {
                return ListTile(
                  title: Text(
                    widget.sections[index].title,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScopedModel<MainPageViewModel>(
                            model: widget.viewModel,
                            child: SectionList(
                                title: widget.sections[index].title,
                                selectedUrl: widget.sections[index].sectionUrl,
                                viewModel: widget.viewModel))));
                  },
                );
              } else if (widget.sections[index].subSections is List) {
                return ExpansionTile(
                  title: Text(widget.sections[index].title),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.add),
                  children: [
                    getItemsListForSideMenu(context, widget.sections[index])
                  ],
                );
              }
            }),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(5.0),
          child: GridView.builder(
              itemCount: getSetting.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3, crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          if (getSetting[index] == "Contact Us") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoadWebPage(
                                    selectedUrl: Configuration.CONTACT_URL,
                                    title: getSetting[index])));
                          }
                          if (getSetting[index] == "Legal Disclaimer") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoadWebPage(
                                    selectedUrl: Configuration.DISCLAIMER_URL,
                                    title: getSetting[index])));
                          }
                          if (getSetting[index] == "Privacy Policy") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoadWebPage(
                                    selectedUrl: Configuration.PRIVACY_URL,
                                    title: getSetting[index])));
                          }
                        },
                        child: Text(getSetting[index])));
              }),
        ),
        ScopedModelDescendant<MainPageViewModel>(builder: (_, __, model) {
          return FutureBuilder<List<Langauages>>(
            future: model.language,
            // ignore: missing_return
            builder: (_, AsyncSnapshot<List<Langauages>> snapshot) {
              switch (snapshot.connectionState) {
                // ignore: missing_return
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    var languageData = snapshot.data;

                    return Container(
                      child: Column(
                        children: <Widget>[
                          languageData.length > 0
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        "PARTNER SITES:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      )))
                              : null,
                          GridView.builder(
                              itemCount: languageData.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 2, crossAxisCount: 2),
                              itemBuilder: (BuildContext context, int index) {
                                return LanguageLogo(
                                    languageData: languageData[index],
                                    context: context);
                              })
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return InternetConnection(
                      action: () async {
                        await model.setLanguageMenu();
                      },
                    );
                  }
              }
            },
          );
        }),
        getSocialIcons(),
      ],
    ));
  }

  Widget getItemsListForSideMenu(BuildContext context, Object subSections) {
    var jsonencode = jsonEncode(subSections);
    print(jsonencode);

    final jsonResponse = json.decode(jsonencode.toString());

    var sectionData = jsonResponse["sub_sections"] as List<dynamic>;

    print(sectionData);

    List<Sections> section = List();

    List<Sections> subsectiondata =
        sectionData.map((p) => Sections.fromSubSection(p)).toList();

    print("Sections:::" + section.toString());

    return Column(
      children: subsectiondata
          .map((item) => ListTile(
                title: Text(item.title),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScopedModel<MainPageViewModel>(
                          model: widget.viewModel,
                          child: SectionList(
                              title: item.title,
                              selectedUrl: item.sectionUrl,
                              viewModel: widget.viewModel))));
                },
                contentPadding: EdgeInsets.only(left: 55.0),
              ))
          .toList(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget LanguageLogo({Langauages languageData, BuildContext context}) {
    return Padding(
        padding: EdgeInsets.all(3.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                  child: Image.network(
                    languageData.thumbnailUrl,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ))
          ],
        ));
  }

  getSocialIcons() {
    return Container(
        child: Column(
      children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "CONNECT WITH US",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/images/facebook.png"),
            Image.asset("assets/images/googleplus.png"),
            Image.asset("assets/images/twitter.png"),
            Image.asset("assets/images/youtube.png")
          ],
        )
      ],
    ));
  }
}
