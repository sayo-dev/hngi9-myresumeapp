import 'package:flutter/material.dart';
import 'package:rezumi/utils/shared_data.dart';

import '../constants/color.dart';

class ThemeProvider extends ChangeNotifier{
 static bool value = ThemeValueStorage.retrieveThemeValue();
  ThemeMode themeMode = value == false ? ThemeMode.light : ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    ThemeValueStorage.storeThemeValue(isOn);
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class DefaultTheme{
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Palette.kLightColor,
    colorScheme: ColorScheme.light()
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Palette.kDarkColor,
    colorScheme: ColorScheme.dark()
  );

}