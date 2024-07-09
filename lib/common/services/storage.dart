import 'dart:convert';

import 'package:learnhub/common/models/entities.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool?>? setString(String key, String? value) async {
    return await _preferences.setString(key, value!);
  }

  String getString(String key) {
    return _preferences.getString(key) ?? "";
  }

  //to check that this is our first time or not
  Future<bool> isFirstTime(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  bool getIsFirstTime() {
    //print(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY);

    // print("storage");

    return _preferences.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY) ??
        false; // when we come first time this value is null so we have used false condition
  }

  bool isLogged() {
    return _preferences.getString(AppConstants.STORAGE_USER_PROFILE) != null
        ? true
        : false;
  }

  UserProfile getUserProfile() {
    var profile =
        _preferences.getString(AppConstants.STORAGE_USER_PROFILE) ?? "";
    var profileJson = jsonDecode(profile);
    var userProfile = UserProfile.fromJson(profileJson);
    return userProfile;
  }

  String getUserToken() {
    return _preferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }
}
