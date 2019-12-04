import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';

class Utils {
  static void share(BuildContext context, String item) {
    final RenderBox box = context.findRenderObject();
    Share.share(item,
        subject:
            "The Smoking Tire heads out to Adams Motorsports Park in Riverside, CA to test the most requested car of 2010, the Volkswagen GTI. Will it beat the Mazdaspeed3's standard-setting lap time? Watch and see...",
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
