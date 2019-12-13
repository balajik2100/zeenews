import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zeenews/AppLocalizations.dart';
import 'package:zeenews/models/SectionResponseData.dart';
import 'package:zeenews/utils/CustomDialog.dart';
import 'package:zeenews/utils/ZeeNewsStyles.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/pages/Hamburger.dart';
import 'package:zeenews/views/widgets/AddNewTab.dart';
import 'package:zeenews/views/widgets/AddNewTab.dart' as prefix0;
import 'package:zeenews/views/widgets/DynamicPage.dart';
import 'package:zeenews/views/widgets/HomeSection.dart';
import 'package:zeenews/views/widgets/LiveSection.dart';
import 'package:zeenews/views/widgets/PhotoSection.dart';
import 'package:zeenews/views/widgets/VideoSection.dart';

class MainPage extends StatefulWidget {
  final MainPageViewModel viewModel;
  final List<String> list;
  final SectionResponseData section;

  MainPage(
      {Key key,
      @required this.viewModel,
      @required this.list,
      @required this.section})
      : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  List<Widget> tabWidgets = List();
  List<Widget> tempWidget = List();

  List<Widget> tabControllerWidgets = List();
  int selectedWidgetlength = 0;
  Widget appBarTitle = Text(Strings.APP_BAR_TITLE,
      style: TextStyle(
          fontSize: CustomFontStyle.APP_FONT_SIZE, color: Colors.white));
  Icon actionIcon = Icon(Icons.search);

  Future loadData() async {
    await widget.viewModel.setHomePageSections("");
    await widget.viewModel.setLanguageMenu();
    await widget.viewModel.setPhotosPageSection("");
    await widget.viewModel.setVideoPageSection("");
  }

  @override
  void initState() {
    super.initState();
    loadData();
    setState(() {
      loadDynamicData();
    });
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    widget.section;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    TabBar tabBar = TabBar(
      controller: tabController,
      indicatorColor: Colors.white,
      indicatorWeight: 3.0,
      isScrollable: true,
      tabs: tabWidgets,
    );

    return new Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(Translations.of(context).text('title')!=null?Translations.of(context).text('title'):"Zee News"),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ScopedModel<MainPageViewModel>(
                                  model: widget.viewModel,
                                  child: CustomDialog(context: context,viewModel: widget.viewModel));
                            });
                      },
                      child:Text("(E)")),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: actionIcon,
                    onPressed: () {
                      setState(() {
                        if (actionIcon.icon == Icons.search) {
                          actionIcon = new Icon(Icons.close);
                          appBarTitle = new TextField(
                            onChanged: (value) {
                              filterResultsValue(value);
                            },
                            controller: editingController,
                            style: new TextStyle(
                              color: Colors.white,
                            ),
                            decoration: new InputDecoration(
                                prefixIcon:
                                    new Icon(Icons.search, color: Colors.white),
                                hintText: "Search...",
                                hintStyle: new TextStyle(color: Colors.white)),
                          );
                        } else {
                          actionIcon = new Icon(Icons.search);
                          appBarTitle = new Text(Translations.of(context).text('title'),
                              style: TextStyle(
                                  fontSize: CustomFontStyle.APP_FONT_SIZE,
                                  color: Colors.white));
                        }
                      });
                    },
                  ),
                  GestureDetector(
                      onTap: () {}, child: Icon(Icons.notifications)),
                  GestureDetector(
                      onTap: () {}, child: Text(" C",)),
                ],
              ),
            ],
          ),
        ),
        centerTitle: false,
        bottom: tabBar,
      ),
      body: ScopedModel<MainPageViewModel>(
        model: widget.viewModel,
        child: TabBarView(
            controller: tabController, children: tabControllerWidgets),
      ),
      drawer: ScopedModel<MainPageViewModel>(
          model: widget.viewModel,
          child: Hamburger(
              viewModel: mainPageVM, sections: widget.section.sections,tabController:tabController)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddTabItem(
                  title: "Add Tab",
                  mainPageVM: mainPageVM,
                  sections: widget.section.sections,
                  sectionMain: widget.section)));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
    ;
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  addIcon(int i, String tabName) {
    if (tabName == "WORLD") {
      return Icon(Icons.cloud_circle);
    }
    if (tabName == "INDIA") {
      return Icon(Icons.location_city);
    }
    if (tabName == "ENTERTAINMENT") {
      return Icon(Icons.perm_media);
    }
    if (tabName == "LIFE STYLE") {
      return Icon(Icons.style);
    }
    if (tabName == "TECHNOLOGY") {
      return Icon(Icons.mobile_screen_share);
    }
    if (tabName == "STATES") {
      return Icon(Icons.ev_station);
    }
    if (tabName == "BUSINESS") {
      return Icon(Icons.business);
    }
    if (tabName == "BHOJPURI") {
      return Icon(Icons.location_city);
    }
  }

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();
  TextEditingController editingController = TextEditingController();

  void filterResultsValue(String value) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (value.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(value)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  void loadDynamicData() {
    /* if(widget.section!=null && widget.section.sections.length>0){
      for(int index=0;index<widget.section.sections.length;index++){
        tabWidgets.add(Tab(text: widget.section.sections[index].title));
        tabControllerWidgets.add(CommonScreen());
      }
    }*/
    tabWidgets = <Widget>[
      Tab(text: Strings.HOME),
      Tab(text: Strings.LIVE),
      Tab(text: Strings.PHOTOS),
      Tab(text: Strings.VIDEOS)
    ];

    tabControllerWidgets = <Widget>[
      HomeScreen(),
      LiveScreen(),
      PhotoScreen(),
      VideosScreen(),
    ];

    if (widget.list != null && widget.list.length > 0) {
      for (int index = 0; index < widget.list.length; index++) {
        tabWidgets.add(Tab(text: widget.list[index]));
        tabControllerWidgets.add(CommonScreen());
      }
    }

    tabController = TabController(vsync: this, length: tabWidgets.length);
  }
}
