import 'package:flutter/material.dart';
import 'package:zeenews/services/ZeeAPIService.dart';
import 'package:zeenews/utils/ServiceLocator.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/pages/SplashScreen.dart';

void main() {

  runApp(ZeeHome(mainPageVM: mainPageVM));
}

final MainPageViewModel mainPageVM =
    MainPageViewModel(apiZeeNews: ZeeAPIService());

// ignore: must_be_immutable
class ZeeHome extends StatelessWidget {
  final MainPageViewModel mainPageVM;
  List<String> tempList = [];

  ZeeHome({@required this.mainPageVM});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.APP_BAR_TITLE,
      theme: new ThemeData(
        primaryColor: CustomColors.APP_BAR_COLOR,
        primaryColorLight: CustomColors.APP_BAR_COLOR,
        primaryColorDark: CustomColors.APP_BAR_COLOR,
      ),
      home: Splash(
        viewModel: mainPageVM,
        list: tempList,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
