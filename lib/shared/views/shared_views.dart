import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/endpoints.dart';
import 'package:yc_app/utils/text_styles.dart';

enum TStyle {
  H1_700,
  H1_600,
  H1_400,
  H2_700,
  H2_600,
  H2_400,
  H3_700,
  H3_600,
  H3_400,
  H4_700,
  H4_600,
  H4_400,
  H5_700,
  H5_600,
  H5_400,
  B1_700,
  B1_600,
  B1_400,
  B2_700,
  B2_600,
  B2_400,
  B3_700,
  B3_600,
  B3_400
}

enum FontName { Nunito, NunitoSemi, NunitoBold }

extension TStyleExtension on TStyle {
  String get toStr => this.toString().split(".").last;
}

class SharedViews {
// static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static late double screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static bool? isTablet;
  static late Map<TStyle, TextStyle> textStyleMap;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    // NOTE: Typical breakpoint for 7-inch tablet
    isTablet = _mediaQueryData.size.shortestSide >= 600;
  }

  static void showToast({required String msg, bool isLongDisplay = false}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: isLongDisplay ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.cBODY_TEXT.withOpacity(0.5),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showDevToast({required String msg, bool isLongDisplay = false}) {
    if (!Endpoints.isProdOrStageEnv) {
      Fluttertoast.showToast(
        msg: msg,
        toastLength: isLongDisplay ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.cBODY_TEXT.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  static bool getIsTablet() {
    return isTablet ?? false;
  }

  static double getScreenWidth(
      {BuildContext? context, double? divideBy, double? multiplyBy}) {
    return screenWidth! * (multiplyBy ?? 1) / (divideBy ?? 1);
  }

  static double getScreenHeight(
      {BuildContext? context, double? divideBy, double? multiplyBy}) {
    return screenHeight * (multiplyBy ?? 1) / (divideBy ?? 1);
  }

  static TextStyle? getTextStyle(
    TStyle style, {
    TextStyle? customStyle,
  }) {
    textStyleMap =
        getIsTablet() ? TextStyles.tabTextStyle : TextStyles.mobTextStyle;
    return customStyle != null
        ? textStyleMap[style]!.merge(customStyle)
        : textStyleMap[style];
  }

  static void showSnackBar({
    required BuildContext context,
    required String title,
    Color? backgroundColor,
  }) {
    final SnackBar snackBar = SnackBar(
      content: Text(title),
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static OutlineInputBorder getBorder({String? state}) {
    switch (state) {
      case 'focused':
        return OutlineInputBorder(
          borderRadius: BorderRadius.all(const Radius.circular(20.0)),
          borderSide: BorderSide(color: AppColors.cGREEN_100),
        );
      case 'error':
        return OutlineInputBorder(
          borderRadius: BorderRadius.all(const Radius.circular(20.0)),
          borderSide: BorderSide(color: AppColors.cERROR),
        );
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.all(const Radius.circular(20.0)),
          borderSide: BorderSide(color: AppColors.cBLACK_20),
        );
    }
  }

  static String getFontName(FontName fontName) {
    return TextStyles.fontName[fontName]!;
  }
}
