import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:zeenews/AppLocalizations.dart';
import 'package:zeenews/models/LanguageResponseData.dart';
import 'package:zeenews/models/SectionResponseData.dart';
import 'package:zeenews/utils/LocalStorageService.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/pages/HomePage.dart';

// ignore: must_be_immutable
class ListviewWidget extends StatelessWidget {
  Langauages language;
  BuildContext context;
  MainPageViewModel viewModel;

  ListviewWidget({@required this.language, @required this.context,@required this.viewModel});

  @override
  Widget build(BuildContext context) {

    var title =Text(
      language.regTitle.toString(),

      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: CustomColors.SECTION_TITLE_TXT_COLOR,
        fontSize: CustomFontStyle.SECTION_TITLE_SIZE,
      ));


    var bannerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(onTap: (){
          loadHomePage();
        },child:Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 0.2,
                  color: Colors.grey //                   <--- border width here
              ),
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(language.thumbnailUrl,
                    height: 50.0, width: 80.0, fit: BoxFit.fill),
                title,
              ],
            )) )

      ],
    );
    // TODO: implement build
    return bannerWidget;
  }
  void loadHomePage() async{
    if(language.title=="Hindi"){
      applic.onLocaleChanged(new Locale('hi',''));
      await viewModel.setHomePageSections("https://zeenews.india.com/hindi/pwaapi/home.php");
      await viewModel.setSectionList();
      _makeGetRequest();
    }
    Navigator.pop(context);
  }
  _makeGetRequest() async {
    List<String> tempList = [];
    print("+++++++++++++++++");
    if (SharedPref().getTabsList() != null &&
        SharedPref().getTabsList() != []) {
      var list = SharedPref().getTabsList();
      list.then((rows) {
        for (int i = 0; i < rows.toList().length; i++) {
          tempList.add(rows.toList()[i]);
        }
      });
    }

   // Map userHeader = {"Content-type": "application/json"};

    Response response = await get("https://zeenews.india.com/hindi/pwaapi/sectionlist.php");

    if (response != null) {
      // sample info available in response
      int statusCode = response.statusCode;

      String jsondata = response.body.trim();
      Map<String, String> headers = response.headers;


      print("SPlash:::::" + jsondata.toString());
      // TODO convert json to object...
      final jsonResponse = json.decode(jsondata);


     SectionResponseData section = new SectionResponseData.fromMap(jsonResponse);

      if (section != null) {
        Route route = MaterialPageRoute(builder: (context) => MainPage(viewModel: viewModel, list: tempList, section: section));
        Navigator.pushReplacement(context, route);
      }
    }
  }
}
