import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/spacing.dart';

import 'package:yc_app/shared/views/shared_views.dart';

Widget buttonFilledLarge(
  text, {
  double? width: 150,
  double? height: 40,
  double fontSize: 16,
  bool? isLoading: false,
  Color textColor: AppColors.cWHITE_100,
  Color bodyColor: AppColors.cGREEN_100,
  Color? disabledColor,
  Color? disabledTextColor,
  Function? onPressed,
  bool disabled: false,
  double? borderRadius,
  Widget? prefixIcon,
  Widget? suffixIcon,
  double? elevation = 2,
}) {
  return Container(
    width: width,
    height: height,
    child: MaterialButton(
      color: bodyColor,
      elevation: elevation,
      textColor: textColor,
      disabledTextColor: disabledTextColor ?? textColor,
      disabledColor: disabledColor ?? bodyColor.withOpacity(0.5),
      onPressed: isLoading! || disabled ? null : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? height! / 2),
      ),
      child: Center(
        child: isLoading
            ? SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.cGREEN_100,
                  ),
                  backgroundColor: AppColors.cWHITE_100,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: prefixIcon,
                    ),
                  Text(
                    text,
                    style: SharedViews.getTextStyle(
                      TStyle.B1_700,
                    )?.copyWith(color: textColor),
                  ),
                  if (suffixIcon != null)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: suffixIcon,
                    ),
                ],
              ),
      ),
    ),
  );
}

Widget buttonFilledSmall(
  text, {
  double width: 150,
  double height: 32,
  bool isLoading: false,
  Color textColor: AppColors.cWHITE_100,
  double radius: 16,
  TStyle font: TStyle.B2_700,
  Function? onPressed,
}) {
  return Container(
    width: width,
    height: height,
    child: MaterialButton(
      color: AppColors.cGREEN_100,
      textColor: textColor,
      disabledTextColor: textColor,
      disabledColor: AppColors.cGREEN_100,
      onPressed: isLoading ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                text,
                style: SharedViews.getTextStyle(
                  font,
                  customStyle: TextStyle(color: textColor),
                ),
              ),
      ),
    ),
  );
}

Widget buttonOutlinedLarge(
  text, {
  double? width: 150,
  double height: 40,
  bool isLoading: false,
  Color textColor: AppColors.cBODY_TEXT,
  Function? onPressed,
  double? borderRadius,
}) {
  return Container(
    width: width,
    height: height,
    child: OutlineButton(
      disabledBorderColor: AppColors.cGREEN_100.withOpacity(0.5),
      borderSide: BorderSide(color: AppColors.cGREEN_100),
      textColor: textColor,
      disabledTextColor: textColor.withOpacity(0.5),
      onPressed: isLoading ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? (height / 2)),
      ),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                text,
                style: SharedViews.getTextStyle(
                  TStyle.B1_700,
                  customStyle: TextStyle(color: textColor),
                ),
              ),
      ),
    ),
  );
}

Widget buttonOutlinedSmall(
  text, {
  double? width,
  double height: 32,
  bool isLoading: false,
  Color textColor: AppColors.cGREEN_100,
  Function? onPressed,
}) {
  return Container(
    width: width,
    height: height,
    child: OutlineButton(
      disabledBorderColor: AppColors.cGREEN_100.withOpacity(0.5),
      borderSide: BorderSide(
        color: AppColors.cGREEN_100,
      ),
      textColor: textColor,
      disabledTextColor: textColor.withOpacity(0.5),
      onPressed: isLoading ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                text,
                style: SharedViews.getTextStyle(
                  TStyle.B2_700,
                  customStyle: TextStyle(color: textColor),
                ),
              ),
      ),
    ),
  );
}

Widget buttonOutlinedWithIconSmall(
  text, {
  double width: 120,
  double height: 32,
  Color textColor: AppColors.cGREEN_100,
  Function? onPressed,
}) {
  return Container(
    width: width,
    height: height,
    child: OutlineButton(
      disabledBorderColor: AppColors.cGREEN_100.withOpacity(0.5),
      borderSide: BorderSide(
        color: AppColors.cGREEN_100,
      ),
      textColor: textColor,
      disabledTextColor: textColor.withOpacity(0.5),
      onPressed: onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: SharedViews.getTextStyle(TStyle.B2_700),
          ),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    ),
  );
}

Widget buttonOutlinedWithIconLarge(
  String text, {
  double? width,
  double height = 40,
  Color textColor = AppColors.cGREEN_100,
  Color borderColor = AppColors.cGREEN_100,
  double? borderRadius,
  Color? disabledBorderColor,
  Widget? prefixIcon,
  Widget? suffixIcon,
  Function? onPressed,
}) {
  return Container(
    width: width,
    height: height,
    child: OutlineButton(
      disabledBorderColor: disabledBorderColor ?? borderColor.withOpacity(0.5),
      borderSide: BorderSide(
        color: borderColor,
      ),
      textColor: textColor,
      disabledTextColor: textColor.withOpacity(0.5),
      onPressed: onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? height / 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: prefixIcon,
            ),
          Text(
            text,
            style: SharedViews.getTextStyle(
              TStyle.B1_700,
            )?.copyWith(color: textColor),
          ),
          if (suffixIcon != null)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: suffixIcon,
            ),
        ],
      ),
    ),
  );
}

class BackButtonWidget extends StatelessWidget {
  BackButtonWidget({this.onTap});

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 43,
      child: IconButton(
        onPressed: onTap != null
            ? () {
                onTap!();
              }
            : () {
                Navigator.pop(context);
              },
        icon: Icon(
          Icons.keyboard_backspace,
          color: AppColors.cBODY_TEXT,
        ),
      ),
    );
  }
}

Widget buttonScheduleFilled(
  BuildContext context,
  text, {
  double width: 150,
  double height: 32,
  double fontSize: 14,
  bool isLoading: false,
  Function? onPressed,
}) {
  return Container(
    width: width,
    height: height,
    child: FlatButton(
      color: AppColors.cGREEN_100,
      textColor: AppColors.cWHITE_100,
      onPressed: isLoading ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: isLoading
            ? SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.cGREEN_100),
                  backgroundColor: AppColors.cWHITE_100,
                ),
              )
            : Text(
                text,
                style: SharedViews.getTextStyle(
                  TStyle.B2_700,
                ),
              ),
      ),
    ),
  );
}

Widget buttonScheduleOutlined(
  BuildContext context,
  text, {
  double width: 150,
  double height: 32,
  double fontSize: 14,
  bool isLoading: false,
  Color textColor: AppColors.cBODY_TEXT,
  Function? onPressed,
}) {
  return Container(
    width: width,
    height: height,
    child: OutlineButton(
      borderSide: BorderSide(color: AppColors.cBLACK_20),
      textColor: textColor.withOpacity(0.5),
      onPressed: isLoading ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text(text, style: SharedViews.getTextStyle(TStyle.B2_700)),
      ),
    ),
  );
}

Widget buttonListingOutlined(
  BuildContext context,
  text, {
  double fontSize: 14,
  bool isLoading: false,
  Color textColor: AppColors.cBODY_TEXT,
  Color borderColor: AppColors.cBLACK_20,
  Color fillColor: Colors.transparent,
  double borderRadius: 6.0,
  Function? onPressed,
}) {
  return Container(
    margin: EdgeInsets.all(1.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: fillColor,
    ),
    child: OutlineButton(
      borderSide: BorderSide(color: borderColor, width: 2.0),
      textColor: textColor,
      onPressed: isLoading ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                text,
                style: SharedViews.getTextStyle(
                  TStyle.B2_700,
                  customStyle: TextStyle(fontSize: fontSize),
                ),
              ),
      ),
    ),
  );
}

Widget buttonViewMore(
  BuildContext context,
  text, {
  double width: 150,
  double height: 32,
  double fontSize: 14,
  bool isLoading: false,
  Color textColor: AppColors.cGREEN_100,
  iconData: Icons.keyboard_arrow_down_sharp,
  Function? onPressed,
  double? borderRadius,
  Color? borderColor,
  bool? iconEnabled = true,
}) {
  return Container(
    width: width,
    height: height,
    child: OutlineButton(
      borderSide: BorderSide(
        color: borderColor ?? AppColors.cBLACK_20,
      ),
      onPressed: isLoading ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius == null
            ? BorderRadius.circular(6.0)
            : BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: SharedViews.getTextStyle(
                      TStyle.B1_700,
                      customStyle: TextStyle(
                        color: textColor,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                  iconEnabled == true
                      ? Icon(iconData, color: AppColors.cGREEN_100)
                      : SizedBox.shrink(),
                ],
              ),
      ),
    ),
  );
}

Widget buttonOutlinedViewMore(
  text, {
  double? width,
  double height: 40,
  Color textColor: AppColors.cGREEN_100,
  Function? onPressed,
}) {
  return Container(
    width: width ?? width,
    height: height,
    child: OutlineButton(
      disabledBorderColor: AppColors.cGREEN_100.withOpacity(0.5),
      borderSide: BorderSide(
        color: AppColors.cGREEN_100,
      ),
      textColor: textColor,
      disabledTextColor: textColor.withOpacity(0.5),
      onPressed: onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: SharedViews.getTextStyle(TStyle.B1_700,
                customStyle: TextStyle(color: textColor)),
          ),
          Icon(Icons.keyboard_arrow_down_sharp),
        ],
      ),
    ),
  );
}

Widget buttonRectangluarFilledSmall(
  text, {
  double width: 150,
  double height: 40,
  double horizontalPadding: 10,
  bool isLoading: false,
  Color textColor: AppColors.cWHITE_100,
  Color bgColor: AppColors.cGREEN_100,
  Function? onPressed,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    width: width,
    height: height,
    child: MaterialButton(
      color: bgColor,
      textColor: textColor,
      disabledTextColor: textColor,
      disabledColor: AppColors.cGREEN_50,
      onPressed: isLoading ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                text,
                style: SharedViews.getTextStyle(
                  TStyle.B1_700,
                  customStyle: TextStyle(color: AppColors.cWHITE_50),
                ),
              ),
      ),
    ),
  );
}

Widget buttonRectangluarFilledLarge(
  text, {
  double width: 150,
  double height: 45,
  bool isLoading: false,
  Color textColor: AppColors.cWHITE_100,
  Color bgColor: AppColors.cGREEN_100,
  Function? onPressed,
}) {
  return Container(
    width: width,
    height: height,
    child: MaterialButton(
      color: bgColor,
      textColor: textColor,
      disabledTextColor: textColor,
      disabledColor: AppColors.cGREEN_100,
      onPressed: isLoading ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                text,
                style: SharedViews.getTextStyle(
                  TStyle.H4_700,
                  customStyle: TextStyle(color: AppColors.cWHITE_50),
                ),
              ),
      ),
    ),
  );
}

Widget buttonRectangularcanDisableSmall(
  text, {
  double width: 160,
  double height: 40,
  bool isDisabled: false,
  Color textColor: AppColors.cGREEN_100,
  Function? onPressed,
}) {
  return Container(
    width: width,
    height: height,
    child: MaterialButton(
      elevation: 0,
      color: isDisabled ? AppColors.cBLACK_05 : AppColors.cGREEN_06,
      textColor: textColor,
      disabledTextColor: AppColors.cBODY_TEXT_50,
      onPressed: isDisabled ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(
          text,
          style: isDisabled
              ? SharedViews.getTextStyle(
                  TStyle.B2_600,
                  customStyle: TextStyle(color: AppColors.cBODY_TEXT_50),
                )
              : SharedViews.getTextStyle(
                  TStyle.B2_600,
                  customStyle: TextStyle(color: textColor),
                ),
        ),
      ),
    ),
  );
}

Widget iconButtonRectangularFilled({
  required String btnIcon,
  required String title,
  String? subTitle,
  double? width,
  double? height,
  bool isLoading: false,
  Color textColor: AppColors.cWHITE_100,
  Color bgColor: AppColors.cGREEN_100,
  Function? onPressed,
  double radius = 6,
}) {
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: 10),
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: AppColors.cRed_25, width: 1),
    ),
    child: MaterialButton(
      color: bgColor,
      textColor: textColor,
      disabledTextColor: textColor,
      disabledColor: AppColors.cGREEN_100,
      onPressed: isLoading ? () {} : onPressed as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      elevation: 0,
      child: Container(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: btnIcon.startsWith("http"),
                    child: btnIcon.split('.').last == 'svg'
                        ? SvgPicture.network(
                            btnIcon,
                            width: 24,
                            height: 24,
                            fit: BoxFit.fill,
                          )
                        : CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: btnIcon,
                            width: 24,
                            height: 24,
                            placeholder: (_, __) => SizedBox(
                                //height: SharedViews.screenHeight / 15,
                                ),
                          ),
                    replacement: SvgPicture.asset(
                      btnIcon,
                      width: 24,
                      height: 24,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: AppSpacing.s,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: SharedViews.getTextStyle(
                          TStyle.H5_700,
                          customStyle: TextStyle(color: textColor),
                        ),
                      ),
                      Text(
                        subTitle ?? "",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: SharedViews.getTextStyle(
                          TStyle.B2_400,
                          customStyle: TextStyle(color: textColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    ),
  );
}
