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
  final String _LangKey = "lang";

  //select Tabs Stored and Retrieved
  Future<List<String>> getTabsList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_TabsKey) ?? [];
  }
  Future<bool> setTabsList(List<String> tabList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(_TabsKey,tabList);
  }

  //select Langs Stored and Retrieved
  Future<String> getStoredLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(_LangKey) ?? "";
  }
  Future<bool> setStoredLanguage(String lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_LangKey,lang);
  }

}