import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yc_app/shared/models/create_anonymous_user_response.model.dart';
import 'package:yc_app/shared/models/user/user.model.dart';

class SharedPreferenceService {
  late SharedPreferences _prefs;

  Future<bool> getSharedPreferencesInstance() async {
    _prefs = await SharedPreferences.getInstance().catchError((e) {
      return false;
    });
    return true;
  }

  Future setUserData(User? user) async {
    if (user == null) {
      return;
    }
    _prefs.setString("userData", user.toJson());
  }

  Future<void> setLoginStatusUserData(User user) async {
    AnonymousUser anonymousUser = anonymousUserData;
    setAnonymousUserData(anonymousUser.copyWith(user: user));
  }

  Future<void> setAnonymousUserData(AnonymousUser user) async {
    _prefs.setString("anonymousUserData", user.toJson());
  }

  Future setVideoResumeMap(map) async {
    if (map == null) {
      return;
    }
    String jsonString = jsonEncode(map);
    _prefs.setString("videoResumeMap", jsonString);
  }

  Future setProfileId(String? profileId) async {
    if (profileId == null) {
      return;
    }
    await _prefs.setString('profileId', profileId);
  }

  Future removeAnonymousUserData() async {
    await _prefs.remove('anonymousUserData');
  }

  Future removeProfileId() async {
    await _prefs.remove('profileId');
  }

  Future setTrackingId(String trackingId) async {
    if (trackingId == null) {
      return;
    }
    await _prefs.setString('trackingId', trackingId);
  }

  Future removeTrackingId() async {
    await _prefs.remove('trackingId');
  }

  Future setSessionId(String sessionId) async {
    if (sessionId == null) {
      return;
    }
    await _prefs.setString('sessionId', sessionId);
  }

  Future removeSessionId() async {
    await _prefs.remove('sessionId');
  }

  Future setAnonymousId(String anonymousId) async {
    if (anonymousId == null) {
      return;
    }
    await _prefs.setString('anonymousId', anonymousId);
  }

  Future removeAnonymousId() async {
    await _prefs.remove('anonymousId');
  }

  Future setAccessToken(String? accessToken) async {
    if (accessToken == null) {
      return;
    }
    await _prefs.setString('accessToken', 'Bearer $accessToken');
  }

  Future removeAccessToken() async {
    await _prefs.remove('accessToken');
  }

  Future setSessionCount(int sessionCount) async {
    await _prefs.setInt('sessionCount', sessionCount);
  }

  Future<bool> setIsFirstOpen({required bool isFirstOpen}) async {
    return _prefs.setBool('isFirstOpen', isFirstOpen);
  }

  String? get accessToken => _prefs.getString('accessToken');

  bool? get seenIntro =>
      _prefs.containsKey('seenIntro') ? _prefs.getBool('seenIntro') : false;

  String? get profileId => _prefs.getString('profileId');

  String? get anonymousId => _prefs.getString('anonymousId');

  String? get trackingId => _prefs.getString('trackingId');

  String? get sessionId => _prefs.getString('sessionId');

  bool get containsTrackingId => _prefs.containsKey("trackingId");

  bool get containsProfileData => _prefs.containsKey("profileData");

  bool get containsUserData => _prefs.containsKey("userData");

  bool get containsProfileId => _prefs.containsKey("profileId");

  bool get containsAccessToken => _prefs.containsKey("accessToken");

  bool get containsSessionCount => _prefs.containsKey("sessionCount");

  bool get containsAnonymousUserData => _prefs.containsKey("anonymousUserData");

  User? get userData {
    String? userJson = _prefs.getString("userData");
    if (userJson?.isEmpty ?? true) {
      return null;
    }
    return User.fromJson(userJson!);
  }

  AnonymousUser get anonymousUserData =>
      AnonymousUser.fromJson(_prefs.getString("anonymousUserData")!);

  Future<void> clearPrefs({List<String> excludeKeys = const []}) async {
    final Map<String, Map<String, dynamic>> excludedPrefsData = {};

    excludeKeys.forEach((String key) {
      _prefs.containsKey(key)
          ? excludedPrefsData[key] = {
              'type': _prefs.get(key).runtimeType.toString(),
              'value': _prefs.get(key),
            }
          : null;
    });

    await _prefs.clear();

    for (final String key in excludedPrefsData.keys) {
      await _resetPrefs(key, excludedPrefsData[key]!);
    }
  }

  Future<void> _resetPrefs(String key, Map<String, dynamic> prefData) async {
    switch (prefData['type']) {
      case 'String':
        await _prefs.setString(key, prefData['value']);
        break;
      case 'bool':
        await _prefs.setBool(key, prefData['value']);
        break;
      case 'int':
        await _prefs.setInt(key, prefData['value']);
        break;
      default:
    }
  }

  bool get containsContentDashVariation => _prefs.containsKey('content-exp');

  void setContentDashVariation(String? value) {
    if (value == null) {
      return;
    }
    _prefs.setString('content-exp', value);
  }
}

SharedPreferenceService sharedPreferenceService = SharedPreferenceService();
