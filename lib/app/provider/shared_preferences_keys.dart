import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../AppTheme/themes.dart';
import 'enum.dart';

class SharedPreferencesKeys {
  setStringData({required String key, required String text}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, text);
  }

  setIntData({required String key, required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, id);
  }

//   _setBoolData({required String key, required bool text}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(key, text);
//   }

  Future<String?> getStringData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<int?> getIntData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

//   Future<bool?> _getBoolData({required String key}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(key);
//   }

  Future<ThemeModeType> getThemeMode() async {
    int? index = await getIntData(key: 'ThemeModeType');
    if (index != null) {
      return ThemeModeType.values[index];
    } else {
      return ThemeModeType.system;
    }
  }

  Future setThemeMode(ThemeModeType type) async {
    await setIntData(key: 'ThemeModeType', id: type.index);
  }

  Future<FontFamilyType> getFontType() async {
    int? index = await getIntData(key: 'FontType');
    if (index != null) {
      return FontFamilyType.values[index];
    } else {
      return FontFamilyType.workSans; // Default we set work span font
    }
  }

  Future setFontType(FontFamilyType type) async {
    await setIntData(key: 'FontType', id: type.index);
  }

  Future<ColorType> getColorType() async {
    int? index = await getIntData(key: 'ColorType');
    if (index != null) {
      return ColorType.values[index];
    } else {
      return ColorType.verdigris; // Default we set Verdigris
    }
  }

  Future setColorType(ColorType type) async {
    await setIntData(key: 'ColorType', id: type.index);
  }


}
