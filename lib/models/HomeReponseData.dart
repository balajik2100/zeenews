
class Section {
  String title;
  String name;
  String type;
  Section({this.title, this.type});
}

class BaseSection extends Section {
  List<Item> data;

  BaseSection(String title, String type,String name, List<Item> data) {
    super.title = title;
    super.type = type;
    super.name = name;
    this.data = data;
  }
}

class SubSection {
  String name;
  String sectionId;
  String sectionUrl;
  List<Item> news;

  SubSection({this.name, this.sectionId, this.sectionUrl, this.news});

  SubSection.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sectionId = json['section_id'];
    sectionUrl = json['section_url'];
    if (json['news'] != null) {
      news = new List<Item>();
      (json['news'] as List<dynamic>).forEach((v) {
        news.add(new Item.fromJson(v));
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
    return data;
  }
}

class Item{
  String title;
  String name;
  String thumbnailUrl;
  String newsType;
  String highlights;
  String timestamp;

  Item(
      {this.title,
        this.thumbnailUrl,
        this.highlights,
        this.timestamp,
        this.newsType});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    name = json['name'];
    thumbnailUrl = json['thumbnail_url'];
    newsType = json['news_type'];
    highlights = json['highlights'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['news_type'] = this.newsType;
    data['highlights'] = this.highlights;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class News extends Item{
  String websiteurl;
  String tag;
  String tagUrl;

  News(
      {
        this.websiteurl,
        this.tag,
        this.tagUrl});

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