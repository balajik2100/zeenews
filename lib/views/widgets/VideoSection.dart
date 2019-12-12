import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zeenews/models/VideoResponseData.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/widgets/CommonPageWidget.dart';
import 'package:zeenews/views/widgets/InternetConnection.dart';

class VideosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<VideoResponseData>(
          future: model.videopage,
          // ignore: missing_return
          builder: (_, AsyncSnapshot<VideoResponseData> snapshot) {
            switch (snapshot.connectionState) {
            // ignore: missing_return
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var sectionsData = snapshot.data;
                  return CommonPageWidget(video: sectionsData,type: "video",);
                }
                else if (snapshot.hasError) {
                  return InternetConnection(
                    action: () async {
                      return Align(alignment: Alignment.center,child:Text("Network Error"));
                    },
                  );

                }
            }
          },
        );
      },
    );;
  }
}