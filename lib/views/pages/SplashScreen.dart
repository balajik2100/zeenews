import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:zeenews/models/SectionResponseData.dart';
import 'package:zeenews/services/ZeeAPIService.dart';
import 'package:zeenews/utils/LocalStorageService.dart';
import 'package:zeenews/utils/NetworkDialog.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/pages/HomePage.dart';

final MainPageViewModel mainPageVM =
    MainPageViewModel(apiZeeNews: ZeeAPIService());

class Splash extends StatefulWidget {
  final MainPageViewModel viewModel;
  final List<String> list;

  Splash({Key key, @required this.viewModel, @required this.list})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  SectionResponseData section;

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    List<String> tempList = [];

    /* return ScopedModel(
      model: MainPageViewModel(apiZeeNews: ZeeAPIService()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Zee News"),
        ),
        body: Center(
          child:

          ScopedModelDescendant<MainPageViewModel>(
            builder: (context, child, model) {
              return FutureBuilder<List<SectionResponseData>>(
                future: model.section,
                // ignore: missing_return
                builder: (BuildContext context, AsyncSnapshot<List<SectionResponseData>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Center(child: const CircularProgressIndicator());
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        var section = snapshot.data;
                        print("section_splash::"+section.toString());
                        return ListView.builder(
                          itemCount: section == null ? 0 : section.length,
                          shrinkWrap: true,
                          itemBuilder: (_, int index) {
                            var film = section[index];
                            print("section_splash::"+film.toString());
                            return MainPage(viewModel: mainPageVM,list: tempList,);
                          },
                        );
                      } else if (snapshot.hasError) {
                        return NoInternetConnection(
                          action: () async {

                          },
                        );
                      }
                  }
                },
              );
            },
          )


        ),
      ),
    );*/

    return (

        Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30.0),
      child: Text("ZEE NEWS",
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 40,
            decoration: TextDecoration.underline,
          )),
    )));
  }

  @override
  void initState() {
    setState(() {
      checkConnectivity();
    });
  }

  void checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      getLocation();
      _makeGetRequest();
    } else {
      networkDialog();
    }
  }
  void networkDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return NetworkDailog(context: context,viewModel: widget.viewModel);
        });
  }

  _makeGetRequest() async {
    List<String> tempList = [];
    print("+++++++++++++++++");
    if (SharedPref().getTabsList() != null &&
        SharedPref().getTabsList() != []) {
      var list = SharedPref().getTabsList();
      list.then((rows) {
        setState(() {
          for (int i = 0; i < rows.toList().length; i++) {
            tempList.add(rows.toList()[i]);
          }
        });
      });
    }

    Response response = await get(Configuration.SECTION_LIST_URL);

    if (response != null) {
      // sample info available in response
      int statusCode = response.statusCode;
      Map<String, String> headers = response.headers;
      String contentType = headers['content-type'];
      String jsondata = response.body;
      print("SPlash:::::" + jsondata.toString());
      // TODO convert json to object...
      final jsonResponse = json.decode(jsondata);

      section = new SectionResponseData.fromMap(jsonResponse);

      if (section != null) {
        /*  Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainPage(
              viewModel: mainPageVM, list: tempList, section: section)));*/
        Route route = MaterialPageRoute(
            builder: (context) => MainPage(
                viewModel: mainPageVM, list: tempList, section: section));
        Navigator.pushReplacement(context, route);
      }
    }else{
      networkDialog();
    }
  }


  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("======>>>>");
    print(position);
    if(position!=null)
      _getPlace(position);
  }
  String _address = ""; // create this variable

  void _getPlace(Position position) async {
    List<Placemark> newPlace = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);

    // this is all you need
    Placemark placeMark  = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String country = placeMark.country;
    String address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
    print("======>>>>>>");
    print(address);

    if(this.mounted){
      setState(() {
        _address = address; // update _address
      });
    }

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
