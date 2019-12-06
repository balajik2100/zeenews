import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zeenews/models/HomeReponseData.dart';
import 'package:zeenews/services/ZeeAPIService.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/widgets/InternetConnection.dart';
import 'package:zeenews/views/widgets/PageWidget.dart';

class SectionList extends StatefulWidget {
  final String title;
  final String selectedUrl;
  final MainPageViewModel viewModel;

  SectionList(
      {@required this.title,
      @required this.selectedUrl,
      @required this.viewModel});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SectionItemState();
  }
}

class _SectionItemState extends State<SectionList> {
  @override
  void initState() {
    // TODO: implement initState
    loadSectionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ScopedModelDescendant<MainPageViewModel>(
          builder: (_, __, model) {
            return FutureBuilder<List<BaseSection>>(
                future: model.homepage,
                // ignore: missing_return
                builder: (_, AsyncSnapshot<List<BaseSection>> snapshot) {
                  switch (snapshot.connectionState) {
                  // ignore: missing_return
                    case ConnectionState.none:
                    case ConnectionState.active:
                     case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        var homeData = snapshot.data;
                        if(homeData.length>0)
                          return PageWidget(homeData: homeData);
                        else
                          return Align(alignment: Alignment.center,child:Text("Coming Soon") );
                      }
                      else if (snapshot.hasError) {
                        return Align(
                          alignment: Alignment.center,
                          child: InternetConnection(
                            action: () async{
                              await widget.viewModel.setHomePageSections(widget.selectedUrl);
                            },
                          ),
                        ) ;

                      }else{
                        return Align(alignment: Alignment.center,child:Text("Coming Soon") );
                      }
                  }
                });
          },
        ));
  }

  void loadSectionData() async {
    await widget.viewModel.setHomePageSections(widget.selectedUrl);
  }
}
