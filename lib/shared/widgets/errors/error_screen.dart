import 'package:flutter/material.dart';

import 'package:yc_app/shared/widgets/errors/overall_error_screen.dart';

class ErrorScreen extends StatelessWidget {
  final Function? onRetry;
  @required
  ErrorScreen({Key? key, this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OverallErrorScreen(
          onRetry: onRetry,
        ),
      ),
    );
  }
}
