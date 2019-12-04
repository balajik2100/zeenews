import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zeenews/interfaces/ZeeNewsAPIInterface.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/models/LanguageResponseData.dart';
import 'package:zeenews/models/SectionResponseData.dart';

class MainPageViewModel extends Model {

  //Section Menu
  Future<List<SectionResponseData>> _section;
  Future<List<SectionResponseData>> get section=>_section;
  set section(Future<List<SectionResponseData>> value){
    _section = value;
    notifyListeners();
  }

  //Live Section
  Future<List<BaseSection>> _homePage;
  Future<List<BaseSection>> get homepage=>_homePage;
  set homepage(Future<List<BaseSection>> value){
    _homePage = value;
    notifyListeners();
  }
  // Language Menu
  Future<List<Langauages>> _language;
  Future<List<Langauages>> get language=>_language;
  set language(Future<List<Langauages>> value){
    _language = value;
    notifyListeners();
  }

  final ZeeNewsAPIInterface apiZeeNews;
  MainPageViewModel({@required this.apiZeeNews});

  //Section Menu
  Future<bool> setSectionList() async {
    section = apiZeeNews?.getSectionList();
    return section!=null;
  }
  //Live Section
  Future<bool> setHomePageSections(String selectedUrl) async{
    homepage = apiZeeNews?.getHomePageSections(selectedUrl);
    return homepage != null;
  }
  //Language Menu
  Future<bool> setLanguageMenu() async{
    language = apiZeeNews?.getLanguageMenu();
    return language!=null;
  }

  /// Wraps [ScopedModel.of] for this [Model].
  static MainPageViewModel of(BuildContext context) =>
      ScopedModel.of<MainPageViewModel>(context);
}