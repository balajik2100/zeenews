import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';

class NetworkDailog extends StatelessWidget {
  BuildContext context;
  MainPageViewModel viewModel;

  NetworkDailog({@required this.context,@required this.viewModel});

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
    return Container(
      height:120,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.white),
      child:
      Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 80,
            child: Text("No Internet Connection",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              child:FlatButton(
                  color: Colors.red,
                  child: Text("EXIT"),
                  onPressed: () {
                    SystemNavigator.pop();
                  })
          )

        ],
      ),
    );
  }


}