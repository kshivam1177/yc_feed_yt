import 'package:flutter/material.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/buttons/buttons.dart';
import 'package:yc_app/utils/assets.dart';
import 'package:yc_app/utils/spacing.dart';

class SomethingWentWrongError extends StatefulWidget {
  final Function? onRetry;

  SomethingWentWrongError({
    Key? key,
    this.onRetry,
  }) : super(key: key);

  @override
  _SomethingWentWrongErrorState createState() =>
      _SomethingWentWrongErrorState();
}

class _SomethingWentWrongErrorState extends State<SomethingWentWrongError> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.error500, fit: BoxFit.fill),
            SizedBox(height: AppSpacing.m),
            Text(
              "Oh no! Something went wrong",
              style: SharedViews.getTextStyle(TStyle.H3_600),
            ),
            SizedBox(height: AppSpacing.m),
            buttonFilledLarge("Retry", onPressed: widget.onRetry),
          ],
        ),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  final Function? onRetry;
  final String errorMessage;

  const ErrorView({Key? key, this.onRetry, this.errorMessage = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppSpacing.m),
            Text(
              this.errorMessage.isEmpty
                  ? "Oh no! Something went wrong"
                  : this.errorMessage,
              style: SharedViews.getTextStyle(TStyle.H3_600),
            ),
            SizedBox(height: AppSpacing.m),
            buttonOutlinedLarge("Retry", onPressed: onRetry),
          ],
        ),
      ),
    );
  }
}
