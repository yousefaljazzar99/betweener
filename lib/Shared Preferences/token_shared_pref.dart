import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/Api usage/model.dart';

class SharedAppPreferences {
  static const themeStatus = "THEMESTATUS";
  static const String languagecode = "language_code";
  static const String tokenKey = "token";
  static const String userInfoKey = "user_info";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(
          themeStatus,
        ) ??
        false;
  }

  setLanguage(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(languagecode, value);
  }

  Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(
          languagecode,
        ) ??
        'en';
  }

Future<void> storeUserInfo(User user) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(userInfoKey, jsonEncode(user.toJson()));
}

Future<User?> retrieveUserInfo() async {
  final prefs = await SharedPreferences.getInstance();
  String? userInfoString = prefs.getString(userInfoKey);
  if (userInfoString != null) {
    return User.fromJson(jsonDecode(userInfoString));
  } else {
    return null;
  }
}


  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  Future<String?> retrieveToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }
}
