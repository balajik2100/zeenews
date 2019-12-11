import 'package:flutter/cupertino.dart';
import 'package:zeenews/models/PhotoResponseData.dart';

class Section {
  String title;
  String name;
  String type;

  Section({this.title, this.type,this.name});
}

class BaseSection extends Section {
  List<Item> data;
  List<ScoreCard> match;

  BaseSection(String title, String type, String name,{@required this.data,@required this.match}) {
    super.title = title;
    super.type = type;
    super.name = name;
    this.data = data;
    this.match = match;
  }
}

class SubSection {
  String name;
  String sectionId;
  String sectionUrl;
  List<Item> news;
  List<ScoreCard> match;

  SubSection({this.name, this.sectionId, this.sectionUrl, this.news,this.match});

  SubSection.fromJson(Map<String, dynamic> json) {
    name =json.containsKey("name")?json['name']:"";
    sectionId = json.containsKey("section_id")?json['section_id']:"";
    sectionUrl = json.containsKey("section_url")?json['section_url']:"";
    if (json.containsKey("news") && json['news'] != null) {
      news = new List<Item>();
      (json['news'] as List<dynamic>).forEach((v) {
        news.add(new Item.fromJson(v));
      });
    }
    if (json.containsKey("match") && json['match'] != null) {
      match = new List<ScoreCard>();
      (json['match'] as List<dynamic>).forEach((v) {
        match.add(new ScoreCard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['section_id'] = this.sectionId;
    data['section_url'] = this.sectionUrl;
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    if (this.match != null) {
      data['match'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScoreCard {
  String id;
  String seriesId;
  String gender;
  String name;
  String title;
  String shortTitle;
  String dateStart;
  String dateEnd;
  String dateLabel;
  String country;
  String status;
  String result;
  String lastGenerated;
  String lastUpdate;
  String manOfSeries;
  String manOfSeriesId;
  String summary;
  String leadImage;
  String matchCountTest;
  String matchCountOdi;
  String matchCountT20;
  String seriesType;
  String seriesTypeLevel;
  List<String> matches;

  ScoreCard(
      {this.id,
        this.seriesId,
        this.gender,
        this.name,
        this.title,
        this.shortTitle,
        this.dateStart,
        this.dateEnd,
        this.dateLabel,
        this.country,
        this.status,
        this.result,
        this.lastGenerated,
        this.lastUpdate,
        this.manOfSeries,
        this.manOfSeriesId,
        this.summary,
        this.leadImage,
        this.matchCountTest,
        this.matchCountOdi,
        this.matchCountT20,
        this.seriesType,
        this.seriesTypeLevel,
        this.matches});

  ScoreCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seriesId = json['series_id'];
    gender = json['gender'];
    name = json['name'];
    title = json['title'];
    shortTitle = json['short_title'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    dateLabel = json['date_label'];
    country = json['country'];
    status = json['status'];
    result = json['result'];
    lastGenerated = json['last_generated'];
    lastUpdate = json['last_update'];
    manOfSeries = json['man_of_series'];
    manOfSeriesId = json['man_of_series_id'];
    summary = json['summary'];
    leadImage = json['lead_image'];
    matchCountTest = json['match_count_test'];
    matchCountOdi = json['match_count_odi'];
    matchCountT20 = json['match_count_t20'];
    seriesType = json['series_type'];
    seriesTypeLevel = json['series_type_level'];
    if (json['matches'] != null) {
      matches = new List<Null>();
      json['matches'].forEach((v) {
        //matches.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['series_id'] = this.seriesId;
    data['gender'] = this.gender;
    data['name'] = this.name;
    data['title'] = this.title;
    data['short_title'] = this.shortTitle;
    data['date_start'] = this.dateStart;
    data['date_end'] = this.dateEnd;
    data['date_label'] = this.dateLabel;
    data['country'] = this.country;
    data['status'] = this.status;
    data['result'] = this.result;
    data['last_generated'] = this.lastGenerated;
    data['last_update'] = this.lastUpdate;
    data['man_of_series'] = this.manOfSeries;
    data['man_of_series_id'] = this.manOfSeriesId;
    data['summary'] = this.summary;
    data['lead_image'] = this.leadImage;
    data['match_count_test'] = this.matchCountTest;
    data['match_count_odi'] = this.matchCountOdi;
    data['match_count_t20'] = this.matchCountT20;
    data['series_type'] = this.seriesType;
    data['series_type_level'] = this.seriesTypeLevel;
    if (this.matches != null) {
     // data['matches'] = this.matches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String title;
  String name;
  String thumbnailUrl;
  String newsType;
  String highlights;
  String timestamp;
  String id;
  List<Entertainment> entertainment;
  List<Item> sports;
  List<Item> business;
  List<Item> dna;

  Item(
      {this.id,
      this.title,
      this.thumbnailUrl,
      this.highlights,
      this.timestamp,
      this.newsType});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    name = json['name'];
    thumbnailUrl = json['thumbnail_url'];
    newsType = json['news_type'];
    highlights = json['highlights'];
    timestamp = json['timestamp'];
    if (json.containsKey("entertainment") && json['entertainment'] != null) {
      entertainment = new List<Entertainment>();
      (json['entertainment'] as List<dynamic>).forEach((v) {
        entertainment.add(new Entertainment.fromJson(v));
      });
    }
    if (json.containsKey("sports") && json['sports'] != null) {
      sports = new List<Item>();
      (json['sports'] as List<dynamic>).forEach((v) {
        sports.add(new Item.fromJson(v));
      });
    }
    if (json.containsKey("business") && json['business'] != null) {
      business = new List<Item>();
      (json['business'] as List<dynamic>).forEach((v) {
        business.add(new Item.fromJson(v));
      });
    }
    if (json.containsKey("dna") && json['dna'] != null) {
      dna = new List<Item>();
      (json['dna'] as List<dynamic>).forEach((v) {
        dna.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['news_type'] = this.newsType;
    data['highlights'] = this.highlights;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class News extends Item {
  String websiteurl;
  String tag;
  String tagUrl;

  News({this.websiteurl, this.tag, this.tagUrl});

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumbnailUrl = json['thumbnail_url'];
    websiteurl = json['websiteurl'];
    tag = json['tag'];
    tagUrl = json['tag_url'];
    newsType = json['news_type'];
    highlights = json['highlights'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['websiteurl'] = this.websiteurl;
    data['tag'] = this.tag;
    data['tag_url'] = this.tagUrl;
    data['news_type'] = this.newsType;
    data['highlights'] = this.highlights;
    return data;
  }
}
