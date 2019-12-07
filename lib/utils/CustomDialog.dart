import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zeenews/interfaces/ZeeNewsAPIInterface.dart';
import 'package:zeenews/models/LanguageResponseData.dart';
import 'package:zeenews/services/ZeeAPIService.dart';
import 'package:zeenews/utils/Utils.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/widgets/InternetConnection.dart';
import 'package:zeenews/views/widgets/ListviewWidget.dart';

class CustomDialog extends StatelessWidget {
  BuildContext context;
  MainPageViewModel viewModel;

  CustomDialog({@required this.context,@required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(builder: (_, __, model) {
      return FutureBuilder<List<Langauages>>(
        future: model.language,
        // ignore: missing_return
        builder: (_, AsyncSnapshot<List<Langauages>> snapshot) {
          switch (snapshot.connectionState) {
            // ignore: missing_return
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                var languageData = snapshot.data;
                return LanguageList(
                    languageData: languageData, context: context,viewModel:viewModel);
              } else if (snapshot.hasError) {
                return InternetConnection(
                  action: () async {
                    await model.setLanguageMenu();
                  },
                );
              }
          }
        },
      );
    });
  }

  Widget LanguageList({List<Langauages> languageData, BuildContext context,MainPageViewModel viewModel}) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child:
        Container(

          alignment: Alignment.center,
          height: Utils.getScreenHeight(context) / 1.8,
          margin: EdgeInsets.only(left: 0.0, right: 0.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft:  Radius.circular(16.0),topRight:  Radius.circular(16.0)),
                      color: Colors.white),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("(E)",style: TextStyle(color: Colors.white),),
                      Text("(E) Select Language",
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close),
                      )
                    ],
                  )),
              Container(
                  height: Utils.getScreenHeight(context) / 2.3,
                  color: Colors.white,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListviewWidget(
                          language: languageData[index], context: context,viewModel:viewModel);
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: languageData.length,
                    physics: ClampingScrollPhysics(),
                  ))
            ],
          ),
        ));
  }
}


