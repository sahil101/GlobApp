import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SPSettings {
  final String fontSizeKey = 'font_size';
  final String colorKey = 'color';
  static SharedPreferences _sp;
  static SPSettings _instance;

  SPSettings._internal();
  //to load cached instance state
  factory SPSettings() {
    if (_instance == null) {
      _instance = SPSettings._internal();
    }
    return _instance;
  }
  Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  Future setColor(int color) {
    return _sp.setInt(colorKey, color);
  }

  Future setfont(double fontSize) {
    return _sp.setDouble(fontSizeKey, fontSize);
  }

  double getfont() {
    double font = _sp.getDouble(fontSizeKey);
    if (font == null) font = 16;
    return font;
  }

  int getColor() {
    int color = _sp.getInt(colorKey);
    if (color == null) {
      color = 0xff1972d2;
    }
    return color;
  }
}
