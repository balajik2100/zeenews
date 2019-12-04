class LanguageResponseData {
  List<Langauages> langauages;

  LanguageResponseData({this.langauages});

  LanguageResponseData.fromJson(Map<String, dynamic> json) {
    if (json['langauages'] != null) {
      langauages = new List<Langauages>();
      json['langauages'].forEach((v) {
        langauages.add(new Langauages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langauages != null) {
      data['langauages'] = this.langauages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Langauages {
  String title;
  String regTitle;
  String thumbnailUrl;
  String url;
  String websiteurl;

  Langauages(
      {this.title,
        this.regTitle,
        this.thumbnailUrl,
        this.url,
        this.websiteurl});

  Langauages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    regTitle = json['reg_title'];
    thumbnailUrl = json['thumbnail_url'];
    url = json['url'];
    websiteurl = json['websiteurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['reg_title'] = this.regTitle;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['url'] = this.url;
    data['websiteurl'] = this.websiteurl;
    return data;
  }
}