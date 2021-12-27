import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

import 'package:uuid/uuid.dart';

import 'package:yc_app/shared/models/user/user.model.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/endpoints.dart';
import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/models/homepage/dashboard_response.model.dart';
import 'package:yc_app/shared/services/shared_preferences_service.dart';
import 'package:yc_app/shared/views/shared_views.dart';

extension Capitalized on String {
  String capitalized() =>
      this.substring(0, 1).toUpperCase() + this.substring(1).toLowerCase();
}

class CommonHelpers {
  static void copyToClipboard(String copyTxt) {
    Clipboard.setData(ClipboardData(text: copyTxt));
  }

  static bool isNotEmptyList(List arr) {
    return arr != null && arr.isNotEmpty;
  }

  static bool isNotEmptyMap(Map map) {
    return map != null && map.isNotEmpty;
  }

  static bool isNotEmptyString(String? str) {
    return str != null && str.isNotEmpty && str != '';
  }

  static bool isNotNullEntity(dynamic x) {
    return x != null;
  }

  static bool isNullEntity(dynamic x) {
    return x == null;
  }

  static T? enumFromString<T>(Iterable<T> values, String value) {
    try {
      return values.firstWhere(
        (type) => type.toString().split(".").last == value,
      );
    } catch (e) {
      return null;
    }
  }

  static bool isNotIos() {
    return !Platform.isIOS;
  }

  static void showAlertDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            insetPadding: EdgeInsets.symmetric(
                horizontal: SharedViews.getScreenWidth() / 2 - 60,
                vertical: 24.0),
            child: Container(
              height: 108,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    child: Container(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: AppColors.cGREEN_50,
                      ),
                      width: 32,
                      height: 32,
                    ),
                    padding: EdgeInsets.only(
                      bottom: 16,
                    ),
                  ),
                  Padding(
                    child: Text(
                      'Please wait …',
                      style: TextStyle(
                        color: AppColors.cBODY_TEXT,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.only(bottom: 4),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static BoxDecoration getBoxDecorationWithSectionBackground({
    required SectionBackground sectionBackground,
    double borderRadius = AppSpacing.s,
  }) {
    Alignment getBeginDirection() {
      switch (sectionBackground.gradientDirection) {
        case "TOP_TO_BOTTOM":
          return Alignment.topCenter;
        case "BOTTOM_TO_TOP":
          return Alignment.bottomCenter;
        case "LEFT_TO_RIGHT":
          return Alignment.centerLeft;
        case "RIGHT_TO_LEFT":
          return Alignment.centerRight;
        default:
          return Alignment.topCenter;
      }
    }

    Alignment getBottomDirection() {
      switch (sectionBackground.gradientDirection) {
        case "TOP_TO_BOTTOM":
          return Alignment.bottomCenter;
        case "BOTTOM_TO_TOP":
          return Alignment.topCenter;
        case "LEFT_TO_RIGHT":
          return Alignment.centerRight;
        case "RIGHT_TO_LEFT":
          return Alignment.centerLeft;
        default:
          return Alignment.bottomCenter;
      }
    }

    BorderRadius? showSectionBorder() {
      if (sectionBackground.shouldLeaveBorder) {
        return BorderRadius.circular(borderRadius);
      } else {
        return null;
      }
    }

    switch (sectionBackground.backgroundType) {
      case "TRANSPARENT":
        return BoxDecoration();
      case "FLAT_COLOR":
        return BoxDecoration(
          borderRadius: showSectionBorder(),
          color: CommonHelpers.colorFromHex(
            sectionBackground.backgroundColor,
          ),
        );
      case "GRADIENT":
        return BoxDecoration(
          borderRadius: showSectionBorder(),
          gradient: LinearGradient(
            begin: getBeginDirection(),
            end: getBottomDirection(),
            colors: [
              CommonHelpers.colorFromHex(
                sectionBackground.gradientColor1,
              ),
              CommonHelpers.colorFromHex(
                sectionBackground.gradientColor2,
              )
            ],
          ),
        );
      default:
        return BoxDecoration();
    }
  }

  static Map<String, String> getAPIHeaders() {
    return CommonHelpers.removeNullParams(
      {
        'profileid': sharedPreferenceService.containsProfileId
            ? sharedPreferenceService.profileId
            : null,
        'Authorization': sharedPreferenceService.containsAccessToken
            ? sharedPreferenceService.accessToken
            : null,
        'trackingId': null,
        'sessionTrackingId': null,
        // 'userAgent1': jsonEncode({
        //   "appVersion": "1.0.0",
        //   "source": "APP",
        //   "os": "ANDROID/IOS",
        //   "timeZone": "${-1 * DateTime.now().timeZoneOffset.inMinutes}",
        // }),
        'userAgent': jsonEncode({
          "source": "APP",
          "os": Platform.isAndroid ? "ANDROID" : "IOS",
          "timeZone": "-330",
          "appVersion": "2.1.4"
        }),
      },
    )!
        .map((String key, dynamic value) => MapEntry(key, value.toString()));
  }

  static String? getMentorName({String? fullName, String? gender}) {
    if (gender == null) {
      return fullName;
    } else if (fullName == null) {
      return 'mentor';
    } else {
      String fName = fullName.split(" ")[0];
      if (gender == "MALE") {
        return fName + " Sir";
      } else {
        return fName + " Ma'am";
      }
    }
  }

  static Color colorFromHex(String? hexColor) {
    if (hexColor == null) {
      return AppColors.cBLACK_05;
    } else {
      final hexCode = hexColor.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    }
  }

  static String dateTimeAgo(DateTime dateTime, {String trailingText = 'ago'}) {
    String timeAgo;
    Duration difference = DateTime.now().difference(dateTime).abs();
    if (difference.inDays > 14) {
      timeAgo = ((difference.inDays) ~/ 7).toString() + ' weeks $trailingText';
    } else if (difference.inDays >= 7) {
      timeAgo = ((difference.inDays) ~/ 7).toString() + ' week $trailingText';
    } else if (difference.inDays > 1) {
      timeAgo = difference.inDays.toString() + ' days $trailingText';
    } else if (difference.inDays == 1) {
      timeAgo = difference.inDays.toString() + ' day $trailingText';
    } else if (difference.inMinutes > 60) {
      timeAgo = difference.inHours.toString() + ' hr $trailingText';
    } else if (difference.inMinutes >= 2) {
      timeAgo = difference.inMinutes.toString() + ' mins $trailingText';
    } else if (difference.inMinutes >= 1) {
      timeAgo = difference.inMinutes.toString() + ' min $trailingText';
    } else if (difference.inSeconds >= 3) {
      return difference.inSeconds.toString() + ' secs $trailingText';
    } else {
      return 'Just now';
    }
    return timeAgo;
  }

  static DateTime? getSubscriptionValidTill() {
    return sharedPreferenceService.containsUserData
        ? sharedPreferenceService.userData!.premiumValidTill
        : null;
  }

  static String getRawDropboxUrl(String url) {
    bool isDropBoxUrl = url.contains('dropbox') && url.endsWith('.mp4');
    return isDropBoxUrl ? '$url?raw=1' : url;
  }

  static int getSubscriptionDaysLeft() {
    DateTime? validTill = sharedPreferenceService.containsUserData
        ? sharedPreferenceService.userData!.premiumValidTill
        : null;
    int daysLeft = validTill != null &&
            validTill.difference(DateTime.now()).inDays >= 0 &&
            DateTime.now().difference(validTill).isNegative
        ? validTill.difference(DateTime.now()).inDays + 1
        : 0;
    return daysLeft;
  }

  static String getDateTimeToDayParseAfter(DateTime date) {
    if (date.difference(DateTime.now()) < Duration(hours: 24) &&
        date.day == DateTime.now().day) {
      return "Today";
    } else if (date.difference(DateTime.now()) < Duration(hours: 48) &&
        date.day == DateTime.now().add(Duration(hours: 24)).day) {
      return "Tomorrow";
    } else {
      return DateFormat('d  MMM').format(date).toString();
    }
  }

  static String cleanMobileNumber(String num) {
    return num.replaceAll('-', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '')
        .trim();
  }

  static Future<String?> getFileNameWithExtension(File file) async {
    if (file != null) {
      if (await file.exists()) {
        //To get file name without extension
        //path.basenameWithoutExtension(file.path);

        //return file with file extension
        return path.basename(file.path);
      }
    }
    return null;
  }

  static String compactNumFormatter(int? val) {
    return NumberFormat.compact().format(val ?? 0);
  }

  static String getVideoUrl(String? url) =>
      (url != null && (url.indexOf('https') >= 0))
          ? url
          : "${Endpoints.baseVideoUrl}/$url";

  static String getStaticVideoUrl(String url) =>
      "${Endpoints.baseStaticVideoUrl}/$url";

  static String getSanitizedUrl(String url) =>
      url.indexOf('https') >= 0 ? url : 'https://$url';

  static String getSanitizedImageUrl({
    required String? imgUrl,
    Map<String, String>? params,
  }) {
    if (imgUrl == null || imgUrl == '') {
      return '';
    }
    Uri x = Uri.parse(imgUrl);
    params = params != null ? params : {};
    String parsedQueryParams;
    Map<String, String> y = {
      ...x.queryParameters,
      ...params,
    };
    parsedQueryParams = y.isEmpty ? '' : Uri(queryParameters: y).toString();
    String finalImgUrl = imgUrl.indexOf('https') >= 0
        ? '${imgUrl.split('?')[0]}${parsedQueryParams}'
        : '${Endpoints.baseImageUrl}${imgUrl.startsWith('/') ? imgUrl : '/$imgUrl'}${parsedQueryParams}';
    // print(['finalImgUrl', finalImgUrl]); // intentional log for testing
    return finalImgUrl;
  }

  static String? pluralizer({int? howMany, String? baseStr}) {
    String? _base;
    switch (baseStr) {
      case 'enrolled_program':
        _base = Intl.plural(
          howMany!,
          zero: '0 Enrolled Programs',
          one: '1 Enrolled Program',
          other: '${compactNumFormatter(howMany)} Enrolled Programs',
        );
        break;

      case 'enrolled_class':
        _base = Intl.plural(
          howMany!,
          zero: 'no class',
          one: '1 class',
          other: '${compactNumFormatter(howMany)} classes',
        );
        break;

      case 'like':
        _base = Intl.plural(
          howMany!,
          zero: '0 likes',
          one: '1 like',
          other: '${compactNumFormatter(howMany)} likes',
        );
        break;

      case 'comment':
        _base = Intl.plural(
          howMany!,
          zero: '0 comments',
          one: '1 comment',
          other: '${compactNumFormatter(howMany)} comments',
        );
        break;

      case 'views':
        _base = Intl.plural(
          howMany!,
          zero: '0 views',
          one: '1 view',
          other: '${compactNumFormatter(howMany)} views',
        );
        break;

      case 'minute':
        _base = Intl.plural(
          howMany!,
          zero: '0 minutes',
          one: '1 minute',
          other: '${compactNumFormatter(howMany)} minutes',
        );
        break;

      case 'second':
        _base = Intl.plural(
          howMany!,
          zero: '0 seconds',
          one: '1 second',
          other: '${compactNumFormatter(howMany)} seconds',
        );
        break;
    }
    return _base;
  }

  static Map<String, dynamic>? removeNullParams(
    Map<String, dynamic>? data, {
    List<String>? excludeParams,
  }) {
    if (excludeParams != null) {
      data!.removeWhere(
          (String k, dynamic v) => v == null && !excludeParams.contains(k));
    } else {
      data!.removeWhere((String k, dynamic v) => v == null);
    }
    return data;
  }

  // VALIDATORS
  static bool isNumber(String str) {
    if (str == null) {
      return false;
    }
    return int.tryParse(str) != null;
  }

  static bool isValidEmail(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isValidName(String name) {
    return RegExp("^[A-Za-zs]{1,}[.]{0,1}[A-Za-zs]{0,}").hasMatch(name) &&
        name.length >= 2;
  }

  static int calculateAge(DateTime? dob) {
    if (dob == null)
      return 0;
    else {
      int childAge = DateTime.now().year - dob.year;
      if (DateTime(DateTime.now().year, dob.month, dob.day)
          .isAfter(DateTime.now())) {
        childAge = childAge - 1;
      }
      return childAge;
    }
  }

  static DateTime? stringToDate(String? date) {
    if (date == null)
      return null;
    else {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    }
  }

  static User? getLoginStatusUser() {
    return sharedPreferenceService.containsUserData
        ? sharedPreferenceService.userData
        : sharedPreferenceService.containsAnonymousUserData
            ? sharedPreferenceService.anonymousUserData.user
            : null;
  }

  static String? getLoginStatusUserId() {
    return sharedPreferenceService.containsUserData
        ? sharedPreferenceService.userData?.id
        : sharedPreferenceService.containsAnonymousUserData
            ? sharedPreferenceService.anonymousUserData.userId
            : null;
  }

  static String? getLoginStatusProfileId() {
    return sharedPreferenceService.containsProfileId
        ? sharedPreferenceService.profileId
        : sharedPreferenceService.containsAnonymousUserData
            ? sharedPreferenceService.anonymousUserData.profileId
            : null;
  }

  int random() {
    Random rn = Random();
    return rn.nextInt(6);
  }

  static int getChildAge({int age = 0}) {
    int ageValue = 0;
    if (age <= 2 && age <= 5) {
      ageValue = 0;
    } else if (age > 5 && age <= 8) {
      ageValue = 1;
    } else if (age > 8 && age <= 10) {
      ageValue = 2;
    } else if (age > 10) {
      ageValue = 3;
    }
    return ageValue;
  }

  static bool compareDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  static Future<String?> getDeviceId() async {
    return "device_Id";
  }

  static String getUUID() {
    final Uuid uuid = Uuid();
    String id = uuid
        .v5(null, DateTime.now().toUtc().toString())
        .split('-')
        .join('')
        .toLowerCase();
    return id;
  }

  static String cleanEventString(String x) =>
      x.replaceAll(' ', '_').toLowerCase();

  static DateTime getDayStartTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  static String? getTimeAgoFromUnixMilliSec(int? milliSeconds,
      {bool isUtc = true}) {
    if (milliSeconds == null) {
      return null;
    }

    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(milliSeconds, isUtc: isUtc);
    return CommonHelpers.dateTimeAgo(dateTime);
  }

  static String? getCommaSeparatedNumber(int? number) {
    var f = NumberFormat("###,###", "en_US");
    return f.format(number);
  }

  static bool isUserLoggedIn() => false;
}
