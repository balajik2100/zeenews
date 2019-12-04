import 'dart:async';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/models/LanguageResponseData.dart';
import 'package:zeenews/models/SectionResponseData.dart';

abstract class ZeeNewsAPIInterface {
  Future<List<SectionResponseData>> getSectionList(); //Section Menu
  Future<List<BaseSection>> getHomePageSections(String selectedUrl); //Live Section
  Future<List<Langauages>> getLanguageMenu(); // Language Menu
}