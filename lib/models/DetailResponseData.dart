import 'package:flutter/material.dart';




class DetailResponseData {
  String updateTime;
  List<Breadcrumb> breadcrumb;
  Newsdetail newsdetail;
  List<Tags> tags;
  List<Authordetail> authordetail;
  List<List> nextArticles;
  List<Null> news;
  List<Null> trendingNews;
  List<Null> taboolaWidget;

  DetailResponseData({this.updateTime, this.breadcrumb, this.newsdetail, this.tags, this.authordetail, this.nextArticles, this.news, this.trendingNews, this.taboolaWidget});

  DetailResponseData.fromJson(Map<String, dynamic> json) {
    updateTime = json['update_time'];
    if (json['breadcrumb'] != null) {
      breadcrumb = new List<Breadcrumb>();
      json['breadcrumb'].forEach((v) { breadcrumb.add(new Breadcrumb.fromJson(v)); });
    }
    newsdetail = json['newsdetail'] != null ? new Newsdetail.fromJson(json['newsdetail']) : null;
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) { tags.add(new Tags.fromJson(v)); });
    }
    if (json['authordetail'] != null) {
      authordetail = new List<Authordetail>();
      json['authordetail'].forEach((v) { authordetail.add(new Authordetail.fromJson(v)); });
    }
    if (json['next_articles'] != null) {
      nextArticles = new List<List>();
   //   json['next_articles'].forEach((v) { nextArticles.add(new List.fromJson(v)); });
    }
    if (json['news'] != null) {
      news = new List<Null>();
   //   json['news'].forEach((v) { news.add(new Null.fromJson(v)); });
    }
    if (json['trending-news'] != null) {
      trendingNews = new List<Null>();
  //    json['trending-news'].forEach((v) { trendingNews.add(new Null.fromJson(v)); });
    }
    if (json['taboola-widget'] != null) {
      taboolaWidget = new List<Null>();
  //    json['taboola-widget'].forEach((v) { taboolaWidget.add(new Null.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['update_time'] = this.updateTime;
    if (this.breadcrumb != null) {
      data['breadcrumb'] = this.breadcrumb.map((v) => v.toJson()).toList();
    }
    if (this.newsdetail != null) {
      data['newsdetail'] = this.newsdetail.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.authordetail != null) {
      data['authordetail'] = this.authordetail.map((v) => v.toJson()).toList();
    }
    if (this.nextArticles != null) {
  //    data['next_articles'] = this.nextArticles.map((v) => v.toJson()).toList();
    }
    if (this.news != null) {
   //   data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    if (this.trendingNews != null) {
  //    data['trending-news'] = this.trendingNews.map((v) => v.toJson()).toList();
    }
    if (this.taboolaWidget != null) {
   //   data['taboola-widget'] = this.taboolaWidget.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Breadcrumb {
  String title;
  String url;
  String webUrl;

  Breadcrumb({this.title, this.url, this.webUrl});

  Breadcrumb.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    webUrl = json['web_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['web_url'] = this.webUrl;
    return data;
  }
}

class Newsdetail {
  String id;
  String source;
  String title;
  String timestamp;
  String publishDate;
  String modifyDate;
  String section;
  String slug;
  String sectionId;
  String summary;
  String content;
  String isLiveblog;
  List<Null> liveUpdates;
  String websiteurl;
  String thumbnailUrl;
  String sectionUrl;
  String sectionweburl;
  String url;
  String newsType;
  String highlights;
  String comments;
  String contentEmbed;

  Newsdetail({this.id, this.source, this.title, this.timestamp, this.publishDate, this.modifyDate, this.section, this.slug, this.sectionId, this.summary, this.content, this.isLiveblog, this.liveUpdates, this.websiteurl, this.thumbnailUrl, this.sectionUrl, this.sectionweburl, this.url, this.newsType, this.highlights, this.comments, this.contentEmbed});

  Newsdetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    title = json['title'];
    timestamp = json['timestamp'];
    publishDate = json['publish_date'];
    modifyDate = json['modify_date'];
    section = json['section'];
    slug = json['slug'];
    sectionId = json['section_id'];
    summary = json['summary'];
    content = json['content'];
    isLiveblog = json['is_liveblog'];
    if (json['live_updates'] != null) {
      liveUpdates = new List<Null>();
      //json['live_updates'].forEach((v) { liveUpdates.add(new Null.fromJson(v)); });
    }
    websiteurl = json['websiteurl'];
    thumbnailUrl = json['thumbnail_url'];
    sectionUrl = json['section_url'];
    sectionweburl = json['sectionweburl'];
    url = json['url'];
    newsType = json['news_type'];
    highlights = json['highlights'];
    comments = json['comments'];
    contentEmbed = json['content_embed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['source'] = this.source;
    data['title'] = this.title;
    data['timestamp'] = this.timestamp;
    data['publish_date'] = this.publishDate;
    data['modify_date'] = this.modifyDate;
    data['section'] = this.section;
    data['slug'] = this.slug;
    data['section_id'] = this.sectionId;
    data['summary'] = this.summary;
    data['content'] = this.content;
    data['is_liveblog'] = this.isLiveblog;
    if (this.liveUpdates != null) {
   //   data['live_updates'] = this.liveUpdates.map((v) => v.toJson()).toList();
    }
    data['websiteurl'] = this.websiteurl;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['section_url'] = this.sectionUrl;
    data['sectionweburl'] = this.sectionweburl;
    data['url'] = this.url;
    data['news_type'] = this.newsType;
    data['highlights'] = this.highlights;
    data['comments'] = this.comments;
    data['content_embed'] = this.contentEmbed;
    return data;
  }
}

class Tags {
  String title;
  int topicid;
  String sectionpageurl;

  Tags({this.title, this.topicid, this.sectionpageurl});

  Tags.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    topicid = json['topicid'];
    sectionpageurl = json['sectionpageurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['topicid'] = this.topicid;
    data['sectionpageurl'] = this.sectionpageurl;
    return data;
  }
}

class Authordetail {
  String title;
  String author;
  String authorThumbnailUrl;
  String authorUrl;
  String authorWebsiteurl;

  Authordetail({this.title, this.author, this.authorThumbnailUrl, this.authorUrl, this.authorWebsiteurl});

  Authordetail.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    authorThumbnailUrl = json['author_thumbnail_url'];
    authorUrl = json['author_url'];
    authorWebsiteurl = json['author_websiteurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['author'] = this.author;
    data['author_thumbnail_url'] = this.authorThumbnailUrl;
    data['author_url'] = this.authorUrl;
    data['author_websiteurl'] = this.authorWebsiteurl;
    return data;
  }
}

class NextArticles {


  NextArticles();

NextArticles.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}