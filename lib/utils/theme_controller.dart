import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/colors.dart';

class ThemeController {

  var themeLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.cGREEN_100,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
      iconTheme: IconThemeData(color: AppColors.cGREEN_100),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: AppColors.cBODY_TEXT,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: SharedViews.getTextStyle(TStyle.B1_400),
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.cGREEN_50),
    //unselectedWidgetColor: AppColors.cNight,
    //indicatorColor: Colors.cyan,
    //selectedRowColor: AppColors.cNight,
  );

  var currentTheme;

  ThemeController() {
    currentTheme = themeLight;
  }

  get getAppTheme => currentTheme;

  changeTheme({required theme}) {
    if (theme == "Dark") {
    }
    // currentTheme = themeDark;
    else
      currentTheme = themeLight;
  }
}
