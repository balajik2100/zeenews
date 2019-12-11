import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zeenews/interfaces/ZeeNewsAPIInterface.dart';
import 'package:zeenews/models/DetailResponseData.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/models/LanguageResponseData.dart';
import 'package:zeenews/models/LiveResponseData.dart';
import 'package:zeenews/models/PhotoResponseData.dart';
import 'package:zeenews/models/SectionResponseData.dart';
import 'package:zeenews/models/VideoResponseData.dart';
import 'package:zeenews/views/pages/DetailsPageWidget.dart';

class MainPageViewModel extends Model {

  //Section Menu
  Future<List<SectionResponseData>> _section;
  Future<List<SectionResponseData>> get section=>_section;
  set section(Future<List<SectionResponseData>> value){
    _section = value;
    notifyListeners();
  }

  //Home Section
  Future<List<BaseSection>> _homePage;
  Future<List<BaseSection>> get homepage=>_homePage;
  set homepage(Future<List<BaseSection>> value){
    _homePage = value;
    notifyListeners();
  }
  //Live Section
  Future<LiveResponseData> _livepage;
  Future<LiveResponseData> get livepage=>_livepage;
  set livepage(Future<LiveResponseData> value){
    _livepage = value;
    notifyListeners();
  }
  //Photos Section
  Future<PhotoResponseData> _photopage;
  Future<PhotoResponseData> get photopage=>_photopage;
  set photopage(Future<PhotoResponseData> value){
    _photopage = value;
    notifyListeners();
  }
  //Videos Section
  Future<VideoResponseData> _videopage;
  Future<VideoResponseData> get videopage=>_videopage;
  set videopage(Future<VideoResponseData> value){
    _videopage = value;
    notifyListeners();
  }

  // Language Menu
  Future<List<Langauages>> _language;
  Future<List<Langauages>> get language=>_language;
  set language(Future<List<Langauages>> value){
    _language = value;
    notifyListeners();
  }

  // Details View
  Future<DetailResponseData> _detailsView;
  Future<DetailResponseData> get detailsView=>_detailsView;
  set detailsView(Future<DetailResponseData> value){
    _detailsView = value;
    notifyListeners();
  }

  final ZeeNewsAPIInterface apiZeeNews;
  MainPageViewModel({@required this.apiZeeNews});

  //Section Menu
  Future<bool> setSectionList() async {
    section = apiZeeNews?.getSectionList();
    return section!=null;
  }
  //Home Section
  Future<bool> setHomePageSections(String selectedUrl) async{
    homepage = apiZeeNews?.getHomePageSections(selectedUrl);
    return homepage != null;
  }
  //Live Section
  Future<bool> setLivePageSections(String selectedUrl) async{
    livepage = apiZeeNews?.getLivePageSection();
    return livepage != null;
  }
  //Photos Section
  Future<bool> setPhotosPageSection(String selectedUrl) async{
    photopage = apiZeeNews?.getPhotoPageSection();
    return photopage != null;
  }
  //Videos Section
  Future<bool> setVideoPageSection(String selectedUrl) async{
    videopage = apiZeeNews?.getVideoPageSection();
    return videopage != null;
  }
  //Language Menu
  Future<bool> setLanguageMenu() async{
    language = apiZeeNews?.getLanguageMenu();
    return language!=null;
  }

  //Details Menu
  Future<bool> setDetailsView(String id) async{
    detailsView = apiZeeNews?.getDetailsView(id);
    return detailsView!=null;
  }

  /// Wraps [ScopedModel.of] for this [Model].
  static MainPageViewModel of(BuildContext context) =>
      ScopedModel.of<MainPageViewModel>(context);
}