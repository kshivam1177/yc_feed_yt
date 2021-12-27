import 'package:flutter/material.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/connection_status_singleton.dart';

Widget internetWidget(Stream<ConnectionStatus?> internetStream) {
  return Align(
    alignment: Alignment.topCenter,
    child: StreamBuilder<ConnectionStatus?>(
      initialData: ConnectionStatus.good,
      stream: internetStream,
      // ignore: always_specify_types
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == ConnectionStatus.good) {
          return SizedBox();
        } else {
          return Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            height: 40,
            width: SharedViews.getScreenHeight(divideBy: 2.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.cBODY_TEXT.withOpacity(0.7),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                      snapshot.data == ConnectionStatus.bad
                          ? Icons.perm_scan_wifi_rounded
                          : Icons.wifi_off_rounded,
                      color: AppColors.cWHITE_100),
                  SizedBox(width: 10),
                  FittedBox(
                    child: Text(
                      snapshot.data == ConnectionStatus.bad
                          ? "Slow network connection"
                          : 'No internet, trying to reconnect...',
                      style: SharedViews.getTextStyle(
                        TStyle.B1_600,
                        customStyle: TextStyle(color: AppColors.cWHITE_100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    ),
  );
}
