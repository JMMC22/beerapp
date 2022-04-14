import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String _kUserIDPrefs = "userId";

  /// ------------------------------------------------------------
  /// Method that returns the user id
  /// ------------------------------------------------------------
  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kUserIDPrefs);
  }

  /// ----------------------------------------------------------
  /// Method that saves the user id
  /// ----------------------------------------------------------
  static Future<bool> setUserId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kUserIDPrefs, value);
  }
}
