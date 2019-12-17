import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zeenews/AppLocalizations.dart';
import 'package:zeenews/services/ZeeAPIService.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/pages/SplashScreen.dart';
import 'package:zeenews/views/pages/SplashScreen.dart' as prefix0;

void main() {

  runApp(ZeeHome(mainPageVM: mainPageVM));
}

final MainPageViewModel mainPageVM =
    MainPageViewModel(apiZeeNews: ZeeAPIService());

/*// ignore: must_be_immutable
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
}*/

class ZeeHome extends StatefulWidget {
  final MainPageViewModel mainPageVM;
  List<String> tempList = [];
  ZeeHome({@required this.mainPageVM});
  @override
  _ZeeHomeState createState() => new _ZeeHomeState();
}

class _ZeeHomeState extends State<ZeeHome> {
  SpecificLocalizationDelegate _localeOverrideDelegate;

  @override
  void initState(){
    super.initState();
    _localeOverrideDelegate = new SpecificLocalizationDelegate(new Locale('en',''));
    ///
    /// Let's save a pointer to this method, should the user wants to change its language
    /// We would then call: applic.onLocaleChanged(new Locale('en',''));
    ///
    applic.onLocaleChanged = onLocaleChange;
  }

  onLocaleChange(Locale locale){
    setState((){
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.white
      ),
      localizationsDelegates: [
        _localeOverrideDelegate,
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: applic.supportedLocales(),
      home: Splash(
        viewModel: mainPageVM,
        list: widget.tempList,
      ),
    );
  }
}

