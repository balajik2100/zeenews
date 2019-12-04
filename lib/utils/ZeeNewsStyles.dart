import 'dart:ui';

class Strings {
  static const String APP_BAR_TITLE = "ZEE NEWS";
  static const String HOME = "HOME";
  static const String LIVE = "LIVE TV";
  static const String PHOTOS = "PHOTOS";
  static const String VIDEOS = "VIDEOS";
}
class CustomColors {

  static const APP_BAR_COLOR = Color(0xFFF44336);
  static const SECTION_TITLE_TXT_COLOR = Color(0xFFd8212a);
  static const SECTION_SUB_TITLE_TXT_COLOR = Color(0xFF000000);
  static const PrimaryColor =  Color(0xFF3366FF);
  static const PrimaryAssentColor =  Color(0xFF3366FF);
  static const PrimaryDarkColor =  Color(0xFF3366FF);
  static const ErroColor =  Color(0xFF3366FF);
  static const ChipBackgroundColor =  Color(0xFFE1E4F3);
}
class Configuration {
  static const String BASE_URL_TEMPORARY = "https://swapi.co/api";


  static const String BASE_URL = "https://stage2.zeenews.com/pwaapi";


  //sectionlist for menu
  static const String SECTION_LIST_URL =BASE_URL+"/sectionlist.php";
  static const String HOME_SECTION_URL =BASE_URL+"/home.php";
  static const String LANGUAGE_MENU_URL =BASE_URL+"/languagemeu.php";

  static const String CONTACT_URL =BASE_URL+"/contact.php";
  static const String DISCLAIMER_URL =BASE_URL+"/disclaimer.php";
  static const String PRIVACY_URL =BASE_URL+"/privacy.php";




  static const String SAMPLE_IMAGE_URL ="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/TearsOfSteel.jpg";
}
class CustomFontStyle {
  static const double APP_FONT_SIZE = 18.0;
  static const double SECTION_TITLE_SIZE = 14.0;
  static const double SECTION_SUBTITLE_SIZE = 12.0;
  static const double APP_SUBTITLE_FONT_SIZE = 16.0;
  static const double APP_BLOG_TXT_SIZE = 12.0;
}