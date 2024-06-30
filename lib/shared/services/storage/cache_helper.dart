import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(String key, bool value) async {
    return await sharedPreferences.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return await sharedPreferences.setInt(key, value);
  }

  static Future<bool> setString(String key, String value) async {
    return await sharedPreferences.setString(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await sharedPreferences.setStringList(key, value);
  }

  static bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  static double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  static int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  static String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  static List<String>? getStringList(String key) {
    return sharedPreferences.getStringList(key);
  }
}