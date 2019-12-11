class LiveResponseData {
  List<LiveTV> liveTV;
  List<Videos> videos;

  LiveResponseData({this.liveTV, this.videos});

  LiveResponseData.fromJson(Map<String, dynamic> json) {
    if (json['LiveTV'] != null) {
      liveTV = new List<LiveTV>();
      json['LiveTV'].forEach((v) {
        liveTV.add(new LiveTV.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = new List<Videos>();
      json['videos'].forEach((v) {
        videos.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.liveTV != null) {
      data['LiveTV'] = this.liveTV.map((v) => v.toJson()).toList();
    }
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LiveTV {
  String title;
  String showTitle;
  String showTime;
  String url;
  String thumbnailUrl;

  LiveTV(
      {this.title, this.showTitle, this.showTime, this.url, this.thumbnailUrl});

  LiveTV.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    showTitle = json['showTitle'];
    showTime = json['showTime'];
    url = json['url'];
    thumbnailUrl = json['thumbnail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['showTitle'] = this.showTitle;
    data['showTime'] = this.showTime;
    data['url'] = this.url;
    data['thumbnail_url'] = this.thumbnailUrl;
    return data;
  }
}

class Videos {
  int id;
  String timestamp;
  String title;
  String url;
  String websiteurl;
  String section;
  String slug;
  String sectionId;
  String thumbnailUrl;
  String sectionUrl;
  String isyoutube;
  String playTime;
  String videourl;
  String newsType;

  Videos(
      {this.id,
        this.timestamp,
        this.title,
        this.url,
        this.websiteurl,
        this.section,
        this.slug,
        this.sectionId,
        this.thumbnailUrl,
        this.sectionUrl,
        this.isyoutube,
        this.playTime,
        this.videourl,
        this.newsType});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestamp = json['timestamp'];
    title = json['title'];
    url = json['url'];
    websiteurl = json['websiteurl'];
    section = json['section'];
    slug = json['slug'];
    sectionId = json['section_id'];
    thumbnailUrl = json['thumbnail_url'];
    sectionUrl = json['section_url'];
    isyoutube = json['isyoutube'];
    playTime = json['playTime'];
    videourl = json['videourl'];
    newsType = json['news_type'];
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
    data['thumbnail_url'] = this.thumbnailUrl;
    data['section_url'] = this.sectionUrl;
    data['isyoutube'] = this.isyoutube;
    data['playTime'] = this.playTime;
    data['videourl'] = this.videourl;
    data['news_type'] = this.newsType;
    return data;
  }
}