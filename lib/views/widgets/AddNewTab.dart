import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeenews/models/SectionResponseData.dart';
import 'package:zeenews/services/ZeeAPIService.dart';
import 'package:zeenews/utils/LocalStorageService.dart';
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
  _AddTabItemState createState() => _AddTabItemState();
}

class _AddTabItemState extends State<AddTabItem> {

  List<String> selectedProgrammingList = List();

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
            flex: 9,
            child: chipSelection(),
          ),
          Expanded(
            flex: 1,
            child: saveSection(),
          ),
        ],
      ),
    );
  }

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
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  )),
            )));
  }

  //update selected tabs menu
  saveSection() {
    return GestureDetector(
        onTap: () {
          // _getActiveTags();
          //navigation and update the screen
          Navigator.of(context).pop();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MainPage(
                      viewModel: mainPageVM,
                      list: selectedProgrammingList,
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

  chipSelection() {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MultiSelectChip(
            widget.sections,
            onSelectionChanged: (selectedList) {
              setState(() {
                selectedProgrammingList = selectedList;
                SharedPref().setTabsList(selectedProgrammingList);
              });
            },
          )
        ],
      ),
    ));
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<Sections> reportList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = List();

  @override
  void initState() {
    loadTags();
  }

  void loadTags() {
    if (SharedPref().getTabsList() != null &&
        SharedPref().getTabsList() != []) {
      var list = SharedPref().getTabsList();
      list.then((rows) {
        setState(() {
          for (int i = 0; i < rows.toList().length; i++) {
            setState(() {
              selectedChoices.add(rows.toList()[i]);
            });
          }
        });
      });
    }
  }

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(4.0),
        child: ChoiceChip(
          label: Text(item.title),
          selected: selectedChoices.contains(item.title),
          labelStyle: TextStyle(color: Colors.white),
          selectedColor: Colors.red,
          backgroundColor: Colors.grey,
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item.title)
                  ? selectedChoices.remove(item.title)
                  : selectedChoices.add(item.title);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });
    return choices;
  }

  clearSection() {
    return GestureDetector(
        onTap: () {
          //  tempList = [];
          //  selectedProgrammingList.clear();
          setState(() {
            selectedChoices.clear();
            SharedPref().setTabsList(selectedChoices);
          });
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 9,
          child: Center(child: Wrap(children: _buildChoiceList())),
        ),
        Expanded(
          flex: 1,
          child: clearSection(),
        )
      ],
    ));
  }
}
