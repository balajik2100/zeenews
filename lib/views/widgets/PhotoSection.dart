import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zeenews/models/PhotoResponseData.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/widgets/CommonPageWidget.dart';
import 'package:zeenews/views/widgets/InternetConnection.dart';

class PhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<PhotoResponseData>(
          future: model.photopage,
          // ignore: missing_return
          builder: (_, AsyncSnapshot<PhotoResponseData> snapshot) {
            switch (snapshot.connectionState) {
            // ignore: missing_return
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var sectionsData = snapshot.data;
                    return CommonPageWidget(photo: sectionsData,type:"photo");
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
    );
  }

  underLineBoxDecoration() {
    return BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.red, width: 1.0)));
  }

  getTitleWidget(String title,bool news) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 9,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 15.0,top: 5.0,bottom: 5.0),
                  child: Container(
                      decoration: underLineBoxDecoration(),
                      child: Text('$title',
                          style: TextStyle(
                              color:news?Colors.black:Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)))),
            )
        )
        ,
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
              padding: EdgeInsets.only(left: 15.0,top: 5.0,bottom: 5.0,right: 5.0),
              child: Container(
                  child: Icon(Icons.arrow_right)
              )),
        )
      ],);
  }
}