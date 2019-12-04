class SectionResponseData {
  List<Sections> sections;

  SectionResponseData({this.sections});

  SectionResponseData.fromMap(Map<String, dynamic> map) {
    if (map['sections'] != null) {
      sections = new List<Sections>();
      map['sections'].forEach((v) {
        sections.add(new Sections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sections != null) {
      data['sections'] = this.sections.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sections {
  String title;
  String slug;
  String sectionUrl;
  String thumbnailUrl;
  Object subSections;
  String newsType;
  Object id;

  Sections(
      {this.title,
        this.slug,
        this.sectionUrl,
        this.thumbnailUrl,
        this.subSections,
        this.newsType,
        this.id});

  Sections.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    sectionUrl = json['section_url'];
    thumbnailUrl = json['thumbnail_url'];
    subSections = json['sub_sections'];
  //  newsType = json['news_type'];
  //  id = json['id'];
  }
  Sections.fromSubSection(Map<String,dynamic> json){
    title = json['title'];
    slug = json['slug'];
    sectionUrl = json['section_url'];
    thumbnailUrl = json['thumbnail_url'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['section_url'] = this.sectionUrl;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['sub_sections'] = this.subSections;
    data['news_type'] = this.newsType;
  //  data['id'] = this.id;
    return data;
  }
}