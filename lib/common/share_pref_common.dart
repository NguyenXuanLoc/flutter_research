import 'package:shared_preferences/shared_preferences.dart';

class PrefCommon {
  static String PREF_TOKEN = "PREF_TOKEN";
  static SharedPreferences preferences;

  static init(SharedPreferences pref) {
    preferences = pref;
  }

  static void saveAccessToken(String token) async {
    await preferences.setString(PREF_TOKEN, token);
    getAccessToken();
  }

  static String getAccessToken() {
    String result = preferences.getString(PREF_TOKEN);
    return result;
  }
}
