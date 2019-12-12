import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/models/PhotoResponseData.dart';

class VideoResponseData {
  List<Breadcrumb> breadcrumb;
  List<NewsDataItem> news;
  List<Item> trendingPhotos;

  VideoResponseData({this.breadcrumb, this.news, this.trendingPhotos});

  VideoResponseData.fromJson(Map<String, dynamic> json) {
    if (json['breadcrumb'] != null) {
      breadcrumb = new List<Breadcrumb>();
      json['breadcrumb'].forEach((v) {
        breadcrumb.add(new Breadcrumb.fromJson(v));
      });
    }
    if (json['news'] != null) {
      news = new List<NewsDataItem>();
      json['news'].forEach((v) {
        news.add(new NewsDataItem.fromJson(v));
      });
    }
    if (json['trending_photos'] != null) {
      trendingPhotos = new List<Null>();
      json['trending_photos'].forEach((v) {
        trendingPhotos.add(new Item.fromJson(v));
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
    if (this.trendingPhotos != null) {
      data['trending_photos'] =
          this.trendingPhotos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
