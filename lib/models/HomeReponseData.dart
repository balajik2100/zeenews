import 'package:flutter/cupertino.dart';

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
  List<Matches> matches;

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
      matches = new List<Matches>();
      json['matches'].forEach((v) {
        matches.add(new Matches.fromJson(v));
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
      data['matches'] = this.matches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  String id;
  String seriesId;
  String matchId;
  String matchTypeId;
  String matchName;
  String matchTitle;
  String matchLevel;
  String dateTime;
  String venue;
  String venueCity;
  String resultStatus;
  String result;
  String toss;
  String manOfMatch;
  String manOfMatchId;
  String hasCommentary;
  String umpireFirst;
  String umpireSecond;
  String umpireThird;
  String referee;
  String description;
  String team1Id;
  String team1ShortName;
  String team1FullName;
  String team1LeftAppeal;
  String team2Id;
  String team2ShortName;
  String team2FullName;
  String team2LeftAppeal;
  String startDateIst;
  String publishedDate;
  String lastUpdated;
  String startStatus;
  String hasCompleted;
  String isLive;
  String isInProgress;
  String isActive;
  String totalOvers;
  String matchKeywords;
  String previewImage;
  String matchFile;
  String currentInning;
  List<Innings> innings;

  Matches(
      {this.id,
        this.seriesId,
        this.matchId,
        this.matchTypeId,
        this.matchName,
        this.matchTitle,
        this.matchLevel,
        this.dateTime,
        this.venue,
        this.venueCity,
        this.resultStatus,
        this.result,
        this.toss,
        this.manOfMatch,
        this.manOfMatchId,
        this.hasCommentary,
        this.umpireFirst,
        this.umpireSecond,
        this.umpireThird,
        this.referee,
        this.description,
        this.team1Id,
        this.team1ShortName,
        this.team1FullName,
        this.team1LeftAppeal,
        this.team2Id,
        this.team2ShortName,
        this.team2FullName,
        this.team2LeftAppeal,
        this.startDateIst,
        this.publishedDate,
        this.lastUpdated,
        this.startStatus,
        this.hasCompleted,
        this.isLive,
        this.isInProgress,
        this.isActive,
        this.totalOvers,
        this.matchKeywords,
        this.previewImage,
        this.matchFile,
        this.currentInning,
        this.innings});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seriesId = json['series_id'];
    matchId = json['match_id'];
    matchTypeId = json['match_type_id'];
    matchName = json['match_name'];
    matchTitle = json['match_title'];
    matchLevel = json['match_level'];
    dateTime = json['date_time'];
    venue = json['venue'];
    venueCity = json['venue_city'];
    resultStatus = json['result_status'];
    result = json['result'];
    toss = json['toss'];
    manOfMatch = json['man_of_match'];
    manOfMatchId = json['man_of_match_id'];
    hasCommentary = json['has_commentary'];
    umpireFirst = json['umpire_first'];
    umpireSecond = json['umpire_second'];
    umpireThird = json['umpire_third'];
    referee = json['referee'];
    description = json['description'];
    team1Id = json['team1_id'];
    team1ShortName = json['team1_short_name'];
    team1FullName = json['team1_full_name'];
    team1LeftAppeal = json['team1_left_appeal'];
    team2Id = json['team2_id'];
    team2ShortName = json['team2_short_name'];
    team2FullName = json['team2_full_name'];
    team2LeftAppeal = json['team2_left_appeal'];
    startDateIst = json['start_date_ist'];
    publishedDate = json['published_date'];
    lastUpdated = json['last_updated'];
    startStatus = json['start_status'];
    hasCompleted = json['has_completed'];
    isLive = json['is_live'];
    isInProgress = json['is_in_progress'];
    isActive = json['is_active'];
    totalOvers = json['total_overs'];
    matchKeywords = json['match_keywords'];
    previewImage = json['preview_image'];
    matchFile = json['match_file'];
    currentInning = json['current_inning'];
    if (json['innings'] != null) {
      innings = new List<Innings>();
      json['innings'].forEach((v) {
        innings.add(new Innings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['series_id'] = this.seriesId;
    data['match_id'] = this.matchId;
    data['match_type_id'] = this.matchTypeId;
    data['match_name'] = this.matchName;
    data['match_title'] = this.matchTitle;
    data['match_level'] = this.matchLevel;
    data['date_time'] = this.dateTime;
    data['venue'] = this.venue;
    data['venue_city'] = this.venueCity;
    data['result_status'] = this.resultStatus;
    data['result'] = this.result;
    data['toss'] = this.toss;
    data['man_of_match'] = this.manOfMatch;
    data['man_of_match_id'] = this.manOfMatchId;
    data['has_commentary'] = this.hasCommentary;
    data['umpire_first'] = this.umpireFirst;
    data['umpire_second'] = this.umpireSecond;
    data['umpire_third'] = this.umpireThird;
    data['referee'] = this.referee;
    data['description'] = this.description;
    data['team1_id'] = this.team1Id;
    data['team1_short_name'] = this.team1ShortName;
    data['team1_full_name'] = this.team1FullName;
    data['team1_left_appeal'] = this.team1LeftAppeal;
    data['team2_id'] = this.team2Id;
    data['team2_short_name'] = this.team2ShortName;
    data['team2_full_name'] = this.team2FullName;
    data['team2_left_appeal'] = this.team2LeftAppeal;
    data['start_date_ist'] = this.startDateIst;
    data['published_date'] = this.publishedDate;
    data['last_updated'] = this.lastUpdated;
    data['start_status'] = this.startStatus;
    data['has_completed'] = this.hasCompleted;
    data['is_live'] = this.isLive;
    data['is_in_progress'] = this.isInProgress;
    data['is_active'] = this.isActive;
    data['total_overs'] = this.totalOvers;
    data['match_keywords'] = this.matchKeywords;
    data['preview_image'] = this.previewImage;
    data['match_file'] = this.matchFile;
    data['current_inning'] = this.currentInning;
    if (this.innings != null) {
      data['innings'] = this.innings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Innings {
  String id;
  String seriesId;
  String matchId;
  String inningId;
  String teamId;
  String isDeclared;
  String isFollowOn;
  String name;
  String team;
  String wicket;
  String run;
  String over;
  String extra;
  String bye;
  String legbye;
  String wide;
  String noBall;
  String runRate;
  String requiredRunRate;
  String currentPartnershipRuns;
  String currentPartnershipBalls;
  String batsman1;
  String batsman2;
  String bowler1;
  String bowler2;
  String inningState;
  String currentOver;
  String remainingOver;

  Innings(
      {this.id,
        this.seriesId,
        this.matchId,
        this.inningId,
        this.teamId,
        this.isDeclared,
        this.isFollowOn,
        this.name,
        this.team,
        this.wicket,
        this.run,
        this.over,
        this.extra,
        this.bye,
        this.legbye,
        this.wide,
        this.noBall,
        this.runRate,
        this.requiredRunRate,
        this.currentPartnershipRuns,
        this.currentPartnershipBalls,
        this.batsman1,
        this.batsman2,
        this.bowler1,
        this.bowler2,
        this.inningState,
        this.currentOver,
        this.remainingOver});

  Innings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seriesId = json['series_id'];
    matchId = json['match_id'];
    inningId = json['inning_id'];
    teamId = json['team_id'];
    isDeclared = json['is_declared'];
    isFollowOn = json['is_follow_on'];
    name = json['name'];
    team = json['team'];
    wicket = json['wicket'];
    run = json['run'];
    over = json['over'];
    extra = json['extra'];
    bye = json['bye'];
    legbye = json['legbye'];
    wide = json['wide'];
    noBall = json['no_ball'];
    runRate = json['run_rate'];
    requiredRunRate = json['required_run_rate'];
    currentPartnershipRuns = json['current_partnership_runs'];
    currentPartnershipBalls = json['current_partnership_balls'];
    batsman1 = json['batsman_1'];
    batsman2 = json['batsman_2'];
    bowler1 = json['bowler_1'];
    bowler2 = json['bowler_2'];
    inningState = json['inning_state'];
    currentOver = json['current_over'];
    remainingOver = json['remaining_over'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['series_id'] = this.seriesId;
    data['match_id'] = this.matchId;
    data['inning_id'] = this.inningId;
    data['team_id'] = this.teamId;
    data['is_declared'] = this.isDeclared;
    data['is_follow_on'] = this.isFollowOn;
    data['name'] = this.name;
    data['team'] = this.team;
    data['wicket'] = this.wicket;
    data['run'] = this.run;
    data['over'] = this.over;
    data['extra'] = this.extra;
    data['bye'] = this.bye;
    data['legbye'] = this.legbye;
    data['wide'] = this.wide;
    data['no_ball'] = this.noBall;
    data['run_rate'] = this.runRate;
    data['required_run_rate'] = this.requiredRunRate;
    data['current_partnership_runs'] = this.currentPartnershipRuns;
    data['current_partnership_balls'] = this.currentPartnershipBalls;
    data['batsman_1'] = this.batsman1;
    data['batsman_2'] = this.batsman2;
    data['bowler_1'] = this.bowler1;
    data['bowler_2'] = this.bowler2;
    data['inning_state'] = this.inningState;
    data['current_over'] = this.currentOver;
    data['remaining_over'] = this.remainingOver;
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
  var id;
  String author;

  String source;
  String url;
  String websiteurl;
  String section;
  String sectionUrl;
  String slug;
  String sectionId;
  var galleryImagesCount;

  Item(
      {this.id,
      this.title,
      this.thumbnailUrl,
      this.highlights,
      this.timestamp,
      this.newsType,
        this.source,
        this.url,
        this.websiteurl,
        this.section,
        this.sectionUrl,
        this. slug,
        this. sectionId,
        this. galleryImagesCount});

  Item.fromJson(Map<String, dynamic> json) {

    id =json.containsKey("id")?json['id']:null;
    title = json['title'];
    name = json['name'];
    thumbnailUrl = json['thumbnail_url'];
    newsType = json['news_type'];
    highlights = json['highlights'];
    timestamp = json['timestamp'];

    author = json['author'];
    source = json['source'];
    url = json['url'];
    websiteurl = json['websiteurl'];
    section = json['section'];
    sectionUrl = json['section_url'];
    slug = json['slug'];
    sectionId = json['section_id'];
    galleryImagesCount = json['gallery_images_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['news_type'] = this.newsType;
    data['highlights'] = this.highlights;
    data['timestamp'] = this.timestamp;


     data['author'] =  author;
     data['source'] =  source;
     data['url'] =  url;
     data['websiteurl'] =  websiteurl;
     data['section'] =  section;
     data['section_url'] =  sectionUrl;
     data['slug'] =  slug;
     data['section_id'] =  sectionId;
     data['gallery_images_count'] =  galleryImagesCount;

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
