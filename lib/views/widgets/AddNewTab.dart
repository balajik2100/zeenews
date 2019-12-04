import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
import 'package:zeenews/models/SectionResponseData.dart';
import 'package:zeenews/services/ZeeAPIService.dart';
import 'package:zeenews/utils/LocalStorageService.dart';
import 'package:zeenews/utils/ServiceLocator.dart';
import 'package:zeenews/view_models/MainPageViewModel.dart';
import 'package:zeenews/views/pages/HomePage.dart';

final MainPageViewModel mainPageVM =
    MainPageViewModel(apiZeeNews: ZeeAPIService());

class AddTabItem extends StatefulWidget {
  final MainPageViewModel mainPageVM;
  final String title;
  final List<Sections> sections;
  final SectionResponseData sectionMain;

  AddTabItem(
      {Key key,
      @required this.mainPageVM,
      @required this.sections,
      @required this.title,
      @required this.sectionMain})
      : super(key: key);

  @override
  _AddTabItem createState() => _AddTabItem();
}

class _AddTabItem extends State<AddTabItem>
    with SingleTickerProviderStateMixin {
  List<String> _list=List();

  bool _symmetry = false;
  bool _singleItem = false;
  bool _horizontalScroll = false;
  int _column = 3;
  double _fontSize = 16;

  @override
  void initState() {
    super.initState();
    setState(() {
      loadTags();
    });
  }

  List _items;
  List<String> tempList = [];

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        //adjust the screen to fit widgets
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: headerSection(),
          ),
          Expanded(
            flex: 8,
            child: _tags1,
          ),
          Expanded(
            flex: 1,
            child: clearSection(),
          ),
          Expanded(
            flex: 1,
            child: saveSection(),
          ),
        ],
      ),
    );
  }

  //showing tags view
  Widget get _tags1 {
    return Tags(
      alignment: WrapAlignment.center,
      key: _tagStateKey,
      symmetry: _symmetry,
      columns: _column,
      horizontalScroll: _horizontalScroll,
      //verticalDirection: VerticalDirection.up, textDirection: TextDirection.rtl,
      heightHorizontalScroll: 60 * (_fontSize / 14),
      itemCount: _items.length,
      itemBuilder: (index) {
        final item = _items[index];

        return ItemTags(
          key: Key(index.toString()),
          index: index,
          title: item,
          active: false,
          pressEnabled: true,
          activeColor: Colors.red,
          highlightColor: Colors.green,
          singleItem: _singleItem,
          customData: item,
          // splashColor: Colors.green,
          combine: ItemTagsCombine.withTextBefore,
          //removeButton: ItemTagsRemoveButton(),
          textScaleFactor:
              utf8.encode(item.substring(0, 1)).length > 2 ? 0.8 : 1,
          textStyle: TextStyle(
            fontSize: _fontSize,
          ),
          onPressed: (item) => {},
        );
      },
    );
  }

// Allows you to get a list of all the ItemTags

  //header section with close icon
  headerSection() {
    return ListTile(
        contentPadding: EdgeInsets.all(18.0),
        title: Text(
          "Topics",
          style: TextStyle(
              color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        trailing: GestureDetector(
            onTap: () {
              //close the page with out updating menu changes
              //Navigator.pop(context);
              Navigator.of(context).pop();
            },
            child: Container(
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            )));
  }

  //clear the selected tabs menu
  clearSection() {
    return GestureDetector(
        onTap: () {
          tempList = [];
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => AddTabItem(
                      title: "Add Tab",
                      mainPageVM: mainPageVM,
                      sections: widget.sections,
                      sectionMain: widget.sectionMain))).then((_) => AddTabItem(
              title: "Add Tab",
              mainPageVM: mainPageVM,
              sections: widget.sections,
              sectionMain: widget.sectionMain));

//          prefix0.Navigator.pop(context);
//          Navigator.push(
//            context,
//            PageRouteBuilder(
//              pageBuilder: (context, anim1, anim2) => AddTabItem(),
//              transitionsBuilder: (context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
//              transitionDuration: Duration(seconds: 1),
//            ),
//          );
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            "Clear All",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.underline),
          ),
        ));
  }

  //update selected tabs menu
  saveSection() {
    return GestureDetector(
        onTap: () {
          _getActiveTags();
          //navigation and update the screen
          Navigator.of(context).pop();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MainPage(
                      viewModel: mainPageVM,
                      list: tempList,
                      section: widget.sectionMain)));


        },
        child: Container(
          alignment: Alignment.center,
          color: Colors.black,
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            "Save",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  void _getActiveTags() {
    List<Item> lst = _tagStateKey.currentState?.getAllItem;
    lst.where((tag) => tag.active).forEach((tag) => tempList.add(tag.title));
    //Store the Tab List in Session
    SharedPref().setTabsList(tempList);
  }

  void loadTags() async {
    if(widget.sections!=null &&  widget.sections.length>0){
      for (int index = 0; index < widget.sections.length; index++) {
        _list.add(widget.sections[index].title.toString());
      }
    }
    _items = _list.toList();
  }
}
