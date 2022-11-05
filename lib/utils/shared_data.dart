import 'package:shared_preferences/shared_preferences.dart';

const _themeKey = 'theme';

class ThemeValueStorage {
  static late final SharedPreferences _theme;

  static Future<void> init() async {
    _theme = await SharedPreferences.getInstance();
  }

  static Future<void> storeThemeValue(bool value) async {
    await _theme.setBool(_themeKey, value);
  }

  static bool retrieveThemeValue() {
    return  _theme.getBool(_themeKey) ?? false;
  }
}