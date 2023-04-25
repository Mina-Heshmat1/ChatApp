import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String Key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(Key, value);
    if (value is int) return await sharedPreferences.setInt(Key, value);
    if (value is bool) return await sharedPreferences.setBool(Key, value);
    return await sharedPreferences.setDouble(Key, value);
  }

  static dynamic getData({
    required String Key,
  }) {
    return sharedPreferences.get(Key);
  }
}
