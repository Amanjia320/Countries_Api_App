import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  // ignore: prefer_final_fields
  var _thememode = ThemeMode.light;
  //This is a private variable that holds the current theme mode. Initially, it is set to ThemeMode.light.

  ThemeMode get thememode => _thememode;

  void setTheme(thememode) {
    _thememode = thememode;
    notifyListeners();
  }
}
