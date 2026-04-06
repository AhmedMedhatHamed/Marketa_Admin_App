import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const _themeKey = 'is_dark_mode';

  static bool getIsDark() => _prefs?.getBool(_themeKey) ?? false;

  static Future<void> saveIsDark(bool isDark) async {
    await _prefs?.setBool(_themeKey, isDark);
  }
}