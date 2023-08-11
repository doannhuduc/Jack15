import 'package:shared_preferences/shared_preferences.dart';

class StorageData {
  static setData({required String key, required String value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  static Future<String> getData({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ontainedEmail = sharedPreferences.getString(key) ?? "";

    return ontainedEmail;
  }

  static removeData({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }
}
