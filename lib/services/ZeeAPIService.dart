import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zeenews/interfaces/ZeeNewsAPIInterface.dart';
import 'package:zeenews/models/DetailResponseData.dart';
import 'package:zeenews/models/LanguageResponseData.dart';
import 'package:zeenews/models/LiveResponseData.dart';
import 'package:zeenews/models/PhotoResponseData.dart';
import 'package:zeenews/models/VideoResponseData.dart';
import 'package:zeenews/utils/Types.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/models/SectionResponseData.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';

class ZeeAPIService implements ZeeNewsAPIInterface {
  // ignore: non_constant_identifier_names
  final ZEE_BASE_URL = Configuration.BASE_URL;

  http.Client _client = http.Client();
  set client(http.Client value) => _client = value;
  static final ZeeAPIService _internal = ZeeAPIService.internal();
  factory ZeeAPIService() => _internal;

  ZeeAPIService.internal();

  //SECTION LIST
  @override
  Future<List<SectionResponseData>> getSectionList() async {
    // TODO: implement get Sectionlist
    var response = await _client.get((Configuration.SECTION_LIST_URL));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> sectionData = data["sections"];
      List<SectionResponseData> sectiondata =
          sectionData.map((p) => SectionResponseData.fromMap(p)).toList();
      print("Sections:::" + sectionData.toString());
      return sectiondata;
    } else {
      throw Exception('Failed to get section data');
    }
  }

  //Live Section
  @override
  Future<List<BaseSection>> getHomePageSections(String selectedURL) async {
    // TODO: implement getHomePage
    String url = "";
    if (selectedURL != "") {
      url = selectedURL;
    } else {
      url = Configuration.HOME_SECTION_URL;
    }
    var response = await _client.get((url));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<BaseSection> sectionData = new List();
      for (String key in map.keys) {
        if (key == "top_news") {
          List<Item> topNewList =
              (map[key] as List<dynamic>).map((v) => Item.fromJson(v)).toList();
          BaseSection s =
              new BaseSection(key, Types.NEWS, "", data: topNewList);
          sectionData.add(s);
        } else if (key == "trending_topic" /*|| key == "most_view"*/) {
          List<Item> topNewList =
              (map[key] as List<dynamic>).map((v) => Item.fromJson(v)).toList();
          BaseSection s =
              new BaseSection(key, Types.CHIPVIEW, "", data: topNewList);
          sectionData.add(s);
        } else if (key == "trending_photos") {
          List<Item> list =
              (map[key] as List<dynamic>).map((v) => Item.fromJson(v)).toList();
          BaseSection s =
              new BaseSection(key, Types.PHOTO_GALLERY, "", data: list);
          sectionData.add(s);
        } /*else if (key == "videos") {
          List<Item> indialist =
              (map[key] as List<dynamic>).map((v) => Item.fromJson(v)).toList();
          BaseSection s =
              new BaseSection(key, Types.VIDEOS, "", data: indialist);
          sectionData.add(s);
        }*/ else if (key == "business" ||
            key == "sports" ||
            key == "entertainment" ||
            key == "india" ||
            key == "lifestyle" ||
            key == "health" ||
            key == "technology" ||
            key == "bhojpuri" ||
            key == "science" ||
            key == "education" ||
            key == "world" ||
            key == "regional-langauge-1" ||
            key == "regional-langauge-2" ||
            key == "videos") {
          SubSection subSection = SubSection.fromJson(map[key][0]);
          List<Item> indialist = subSection.news;
          String name = subSection.name;
          BaseSection s =
              new BaseSection(key, Types.NEWS, name, data: indialist);
          sectionData.add(s);
        } else if (key == "watch_live_tv") {
          List<Item> topNewList =
              (map[key] as List<dynamic>).map((v) => Item.fromJson(v)).toList();
          BaseSection s =
              new BaseSection(key, Types.LIVE, "", data: topNewList);
          sectionData.add(s);
        } else if (key == "blogs") {
          List<Item> topNewList =
              (map[key] as List<dynamic>).map((v) => Item.fromJson(v)).toList();
          BaseSection s =
              new BaseSection(key, Types.BLOG, "", data: topNewList);
          sectionData.add(s);
        } else if (key == "news" ||
            key == "brief_news" ||
            key == "latestnews") {
          List<Item> topNewList =
              (map[key] as List<dynamic>).map((v) => Item.fromJson(v)).toList();
          BaseSection s =
              new BaseSection(key, Types.SECTION_MENU, "", data: topNewList);
          sectionData.add(s);
        } else if (key == "breaking_news") {
          List<Item> topNewList =
              (map[key] as List<dynamic>).map((v) => Item.fromJson(v)).toList();
          BaseSection s =
              new BaseSection(key, Types.BREAKINGNEWS, "", data: topNewList);
          sectionData.add(s);
        } else if (key == "score_card") {
          List<ScoreCard> topNewList = (map[key] as List<dynamic>)
              .map((v) => ScoreCard.fromJson(v))
              .toList();
          BaseSection s =
              new BaseSection(key, Types.SCORECARD, "", match: topNewList);
          sectionData.add(s);
        }
      }
      return sectionData;
    } else {
      throw Exception('Failed to get home section data');
    }
  }
  //Language Menu
  @override
  Future<List<Langauages>> getLanguageMenu() async {
    // TODO: implement getLanguageMenu
    var response = await _client.get(Configuration.LANGUAGE_MENU_URL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> languageData = data["langauages"];

      List<Langauages> langList =
          languageData.map((p) => Langauages.fromJson(p)).toList();
      print("langauages:" + langList.toString());
      return langList;
    } else {
      throw Exception("Failed to get language data");
    }
  }

  @override
  Future<DetailResponseData> getDetailsView(String id) async {
    // TODO: implement getLanguageMenu
    var response = await _client.get(Configuration.DETAILS_VIEW_URL + id);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      DetailResponseData details = DetailResponseData.fromJson(data);
      return details;
    } else {
      throw Exception("Failed to get details data");
    }
  }

  @override
  Future<LiveResponseData> getLivePageSection() async {
    // TODO: implement getLivePageSection
    var response = await _client.get(Configuration.LIVE_SECTION_URL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      LiveResponseData details = LiveResponseData.fromJson(data);
      return details;
    } else {
      throw Exception("Failed to get live data");
    }
  }

  @override
  Future<PhotoResponseData> getPhotoPageSection() async {
    // TODO: implement getPhotoPageSection
    var response = await _client.get(Configuration.PHOTOS_SECTION_URL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      PhotoResponseData details = PhotoResponseData.fromJson(data);
      return details;
    } else {
      throw Exception("Failed to get photos data");
    }
  }

  @override
  Future<VideoResponseData> getVideoPageSection() async {
    // TODO: implement getVideoPageSection
    var response = await _client.get(Configuration.VIDEOS_SECTION_URL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      VideoResponseData details = VideoResponseData.fromJson(data);
      return details;
    } else {
      throw Exception("Failed to get video data");
    }
  }


}
