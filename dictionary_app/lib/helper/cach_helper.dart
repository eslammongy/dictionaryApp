import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setAppTheme({String key, bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool getAppTheme({String key}) {
    return sharedPreferences.getBool(key);
  }
}
