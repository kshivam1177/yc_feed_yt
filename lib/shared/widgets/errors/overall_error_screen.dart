import 'package:flutter/material.dart';

import 'package:yc_app/shared/widgets/errors/no_internet_error.dart';
import 'package:yc_app/shared/widgets/errors/something_went_wrong_error.dart';
import 'package:yc_app/utils/connection_status_singleton.dart';

class OverallErrorScreen extends StatefulWidget {
  final Function? onRetry;

  OverallErrorScreen({Key? key, this.onRetry}) : super(key: key);

  @override
  _OverallErrorScreenState createState() => _OverallErrorScreenState();
}

class _OverallErrorScreenState extends State<OverallErrorScreen> {
  @override
  void initState() {
    super.initState();
    connectionStatus.connectionChangeController.add(null);
    connectionStatus.checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<ConnectionStatus?>(
        stream: connectionStatus.connectionChangeController.stream,
        builder: (
          BuildContext context,
          AsyncSnapshot<ConnectionStatus?> snapshot,
        ) {
          if (snapshot.hasData) {
            if (snapshot.data == ConnectionStatus.none) {
              return NoInternetError(
                onRetry: widget.onRetry,
              );
            } else {
              return SomethingWentWrongError(
                onRetry: widget.onRetry,
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
