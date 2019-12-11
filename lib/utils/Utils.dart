import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:zeenews/models/DetailResponseData.dart';

class Utils {
  static void share(BuildContext context, DetailResponseData item) {
    final RenderBox box = context.findRenderObject();
    Share.share(item.newsdetail.thumbnailUrl!=null?item.newsdetail.thumbnailUrl:"",
        subject:item.newsdetail.title!=null?item.newsdetail.title:"",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  static String upperCase(String title) {
   return title.replaceAll("_", " ").toUpperCase();
  }
  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }


}
