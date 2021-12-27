import 'package:flutter/material.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/colors.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    this.title = 'Continue',
    this.iconPath = '',
    this.onCallback,
    this.isIcon = false,
    this.isPrefix = false,
    this.isLoading = false,
    this.disable = true,
    this.width = 0.38,
    this.height = 45.0,
  }) : super(key: key);
  final VoidCallback? onCallback;
  final String? title;
  final String iconPath;
  final bool isIcon;
  final double width;
  final double height;
  final bool isPrefix;
  final bool disable;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: SharedViews.getScreenWidth(multiplyBy: width),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
          ),
          height: height,
          child: RaisedButton(
            color: disable ? AppColors.cBLACK_10 : AppColors.cGREEN_100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
            ),
            disabledColor: disable
                ? AppColors.cGREEN_100.withOpacity(0.5)
                : AppColors.cGREEN_100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                isLoading
                    ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.cWHITE_100,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      )
                    : Text(
                        title ?? "Continue",
                        style: SharedViews.getTextStyle(
                          TStyle.B1_700,
                          customStyle: TextStyle(color: AppColors.cWHITE_100),
                        ),
                      ),
              ],
            ),
            onPressed: (disable || isLoading == true) ? null : onCallback,
          ),
        ),
      ),
    );
  }
}
