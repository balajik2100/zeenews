import 'package:zeenews/models/HomeReponseData.dart';

class PhotoResponseData {
  List<Breadcrumb> breadcrumb;
  List<NewsDataItem> news;
  List<Item> trendingPhotos;

  PhotoResponseData({this.breadcrumb, this.news, this.trendingPhotos});

  PhotoResponseData.fromJson(Map<String, dynamic> json) {
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

class NewsDataItem {

  List<Entertainment> entertainment;
  List<Sports> sports;
  List<Business> business;

  NewsDataItem({this.entertainment, this.sports, this.business});

  NewsDataItem.fromJson(Map<String, dynamic> json) {
    if (json['entertainment'] != null) {
      entertainment = new List<Entertainment>();
      json['entertainment'].forEach((v) {
        entertainment.add(new Entertainment.fromJson(v));
      });
    }
    if (json['sports'] != null) {
      sports = new List<Sports>();
      json['sports'].forEach((v) {
        sports.add(new Sports.fromJson(v));
      });
    }
    if (json['business'] != null) {
      business = new List<Business>();
      json['business'].forEach((v) {
        business.add(new Business.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entertainment != null) {
      data['entertainment'] = this.entertainment.map((v) => v.toJson()).toList();
    }
    if (this.sports != null) {
      data['sports'] = this.sports.map((v) => v.toJson()).toList();
    }
    if (this.business != null) {
      data['business'] = this.business.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Sports {
  String name;
  String sectionId;
  String sectionUrl;
  List<Item> photos;

  Sports({this.name, this.sectionId, this.sectionUrl, this.photos});

  Sports.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sectionId = json['section_id'];
    sectionUrl = json['section_url'];
    if (json['photos'] != null) {
      photos = new List<Item>();
      json['photos'].forEach((v) {
        photos.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['section_id'] = this.sectionId;
    data['section_url'] = this.sectionUrl;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Business {
  String name;
  String sectionId;
  String sectionUrl;
  List<Item> photos;

  Business({this.name, this.sectionId, this.sectionUrl, this.photos});

  Business.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sectionId = json['section_id'];
    sectionUrl = json['section_url'];
    if (json['photos'] != null) {
      photos = new List<Item>();
      json['photos'].forEach((v) {
        photos.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['section_id'] = this.sectionId;
    data['section_url'] = this.sectionUrl;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entertainment {
  String name;
  String sectionId;
  String sectionUrl;
  List<Item> photos;

  Entertainment({this.name, this.sectionId, this.sectionUrl, this.photos});

  Entertainment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sectionId = json['section_id'];
    sectionUrl = json['section_url'];
    if (json['photos'] != null) {
      photos = new List<Item>();
      json['photos'].forEach((v) {
        photos.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['section_id'] = this.sectionId;
    data['section_url'] = this.sectionUrl;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  int id;
  String timestamp;
  String title;
  String author;
  String source;
  String url;
  String websiteurl;
  String section;
  String sectionUrl;
  String slug;
  String sectionId;
  String thumbnailUrl;
  String newsType;
  int galleryImagesCount;

  Photos(
      {this.id,
        this.timestamp,
        this.title,
        this.author,
        this.source,
        this.url,
        this.websiteurl,
        this.section,
        this.sectionUrl,
        this.slug,
        this.sectionId,
        this.thumbnailUrl,
        this.newsType,
        this.galleryImagesCount});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestamp = json['timestamp'];
    title = json['title'];
    author = json['author'];
    source = json['source'];
    url = json['url'];
    websiteurl = json['websiteurl'];
    section = json['section'];
    sectionUrl = json['section_url'];
    slug = json['slug'];
    sectionId = json['section_id'];
    thumbnailUrl = json['thumbnail_url'];
    newsType = json['news_type'];
    galleryImagesCount = json['gallery_images_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timestamp'] = this.timestamp;
    data['title'] = this.title;
    data['author'] = this.author;
    data['source'] = this.source;
    data['url'] = this.url;
    data['websiteurl'] = this.websiteurl;
    data['section'] = this.section;
    data['section_url'] = this.sectionUrl;
    data['slug'] = this.slug;
    data['section_id'] = this.sectionId;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['news_type'] = this.newsType;
    data['gallery_images_count'] = this.galleryImagesCount;
    return data;
  }
}