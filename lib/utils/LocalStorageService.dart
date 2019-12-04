import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  final String _TabsKey = "tabs";

  //select Tabs Stored and Retrieved
  Future<List<String>> getTabsList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_TabsKey) ?? [];
  }
  Future<bool> setTabsList(List<String> tabList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(_TabsKey,tabList);
  }


}