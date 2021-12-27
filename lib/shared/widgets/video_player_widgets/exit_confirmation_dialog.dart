import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:yc_app/shared/widgets/buttons/buttons.dart';
import 'package:yc_app/shared/views/shared_views.dart';

Future showExitClassConfirmationDialog({
  required BuildContext context,
  String? source,
  Function? onExit,
  Function? onCancel,
  bool isLive: true,
}) async {
  return await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (_) => ExitClassConfirmationDialog(
      source: source,
      onExit: onExit,
      onCancel: onCancel,
      isLive: isLive,
    ),
  );
}

class ExitClassConfirmationDialog extends StatelessWidget {
  final String? source;
  final Function? onExit;
  final Function? onCancel;
  final bool? shouldCallLiveClassLeave;
  final bool? isLive;

  ExitClassConfirmationDialog({
    Key? key,
    this.source,
    this.onExit,
    this.onCancel,
    this.shouldCallLiveClassLeave,
    this.isLive,
  });
  @override
  Widget build(context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 400,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            Text(
              'Are you sure, you want to leave current class?',
              style: SharedViews.getTextStyle(TStyle.H5_700),
            ),
            SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: buttonFilledLarge(
                    'Yes',
                    onPressed: () {
                      Navigator.pop(context);
                      if (onExit != null) {
                        onExit!();
                      }
                    },
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: buttonOutlinedLarge(
                    'No',
                    onPressed: () {
                      Navigator.pop(context);
                      if (onCancel != null) {
                        onCancel!();
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
