import 'dart:async';
import 'package:zeenews/models/DetailResponseData.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/models/LanguageResponseData.dart';
import 'package:zeenews/models/LiveResponseData.dart';
import 'package:zeenews/models/PhotoResponseData.dart';
import 'package:zeenews/models/SectionResponseData.dart';
import 'package:zeenews/models/VideoResponseData.dart';

abstract class ZeeNewsAPIInterface {
  Future<List<SectionResponseData>> getSectionList(); //Section Menu
  Future<List<BaseSection>> getHomePageSections(String selectedUrl); //Home Section
  Future<List<Langauages>> getLanguageMenu(); // Language Menu
  Future<DetailResponseData> getDetailsView(String id); // Language Menu

  Future<LiveResponseData> getLivePageSection();
  Future<PhotoResponseData> getPhotoPageSection();
  Future<VideoResponseData> getVideoPageSection();


}