import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instacia = UserPreferences._internal();

  factory UserPreferences() {
    return _instacia;
  }
  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

//todo: DATA ***************************************************
  //************ */  GET y SET del language
  String get language {
    return _prefs.getString('language') ?? "Yкраїнська";
  }

  set language(String value) {
    _prefs.setString('language', value);
  }

  //************ */  GET y SET del environment
  int get environment {
    return _prefs.getInt('environment') ?? 0;
  }

  set environment(int value) {
    _prefs.setInt('environment', value);
  }

  //************ */  GET y SET del version app
  String get versionapp {
    return _prefs.getString('versionapp') ?? "1.0.0";
  }

  set versionapp(String value) {
    _prefs.setString('versionapp', value);
  }
}
