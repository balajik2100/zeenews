import 'package:zeenews/models/HomeReponseData.dart';

class VideoResponseData {
  List<Breadcrumb> breadcrumb;
  List<NewsData> news;
  List<Item> trendingNews;

  VideoResponseData({this.breadcrumb, this.news, this.trendingNews});

  VideoResponseData.fromJson(Map<String, dynamic> json) {
    if (json['breadcrumb'] != null) {
      breadcrumb = new List<Breadcrumb>();
      json['breadcrumb'].forEach((v) {
        breadcrumb.add(new Breadcrumb.fromJson(v));
      });
    }
    if (json['news'] != null) {
      news = new List<NewsData>();
      json['news'].forEach((v) {
        news.add(new NewsData.fromJson(v));
      });
    }
    if (json['trending-news'] != null) {
      trendingNews = new List<Null>();
      json['trending-news'].forEach((v) {
        trendingNews.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breadcrumb != null) {
      data['breadcrumb'] = this.breadcrumb.map((v) => v.toJson()).toList();
    }
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    if (this.trendingNews != null) {
      data['trending-news'] = this.trendingNews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Breadcrumb {
  String title;
  String url;
  String websiteurl;

  Breadcrumb({this.title, this.url, this.websiteurl});

  Breadcrumb.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    websiteurl = json['websiteurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['websiteurl'] = this.websiteurl;
    return data;
  }
}

class NewsData {
  List<Entertainment> entertainment;
  List<Item> sports;
  List<Item> business;
  List<Item> dna;

  NewsData({this.entertainment, this.sports, this.business, this.dna});

  NewsData.fromJson(Map<String, dynamic> json) {
    if (json['entertainment'] != null) {
      entertainment = new List<Entertainment>();
      json['entertainment'].forEach((v) {
        entertainment.add(new Entertainment.fromJson(v));
      });
    }
    if (json['sports'] != null) {
      sports = new List<Item>();
      json['sports'].forEach((v) {
        sports.add(new Item.fromJson(v));
      });
    }
    if (json['business'] != null) {
      business = new List<Item>();
      json['business'].forEach((v) {
        business.add(new Item.fromJson(v));
      });
    }
    if (json['dna'] != null) {
      dna = new List<Item>();
      json['dna'].forEach((v) {
        dna.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entertainment != null) {
      data['entertainment'] =
          this.entertainment.map((v) => v.toJson()).toList();
    }
    if (this.sports != null) {
      data['sports'] = this.sports.map((v) => v.toJson()).toList();
    }
    if (this.business != null) {
      data['business'] = this.business.map((v) => v.toJson()).toList();
    }
    if (this.dna != null) {
      data['dna'] = this.dna.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entertainment {
  int id;
  String timestamp;
  String title;
  String url;
  String websiteurl;
  String section;
  String slug;
  String sectionId;
  String sectionUrl;
  String content;
  String summary;
  String thumbnailUrl;
  String isyoutube;
  String playtime;
  String newsType;
  String videourl;

  Entertainment(
      {this.id,
        this.timestamp,
        this.title,
        this.url,
        this.websiteurl,
        this.section,
        this.slug,
        this.sectionId,
        this.sectionUrl,
        this.content,
        this.summary,
        this.thumbnailUrl,
        this.isyoutube,
        this.playtime,
        this.newsType,
        this.videourl});

  Entertainment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestamp = json['timestamp'];
    title = json['title'];
    url = json['url'];
    websiteurl = json['websiteurl'];
    section = json['section'];
    slug = json['slug'];
    sectionId = json['section_id'];
    sectionUrl = json['section_url'];
    content = json['content'];
    summary = json['summary'];
    thumbnailUrl = json['thumbnail_url'];
    isyoutube = json['isyoutube'];
    playtime = json['playtime'];
    newsType = json['news_type'];
    videourl = json['videourl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timestamp'] = this.timestamp;
    data['title'] = this.title;
    data['url'] = this.url;
    data['websiteurl'] = this.websiteurl;
    data['section'] = this.section;
    data['slug'] = this.slug;
    data['section_id'] = this.sectionId;
    data['section_url'] = this.sectionUrl;
    data['content'] = this.content;
    data['summary'] = this.summary;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['isyoutube'] = this.isyoutube;
    data['playtime'] = this.playtime;
    data['news_type'] = this.newsType;
    data['videourl'] = this.videourl;
    return data;
  }
}