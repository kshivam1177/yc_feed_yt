import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:yc_app/modules/home/content_dashboard.dart';
import 'package:yc_app/modules/home/new_dashboard_entry.dart';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/errors/overall_error_screen.dart';

import 'package:yc_app/blocs/splash_bloc.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late SplashBloc splashBloc;

  @override
  void initState() {
    super.initState();
    splashBloc = SplashBloc();
    splashBloc.getAnonymousUser();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Future<void>.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return ContentDashboard();
            // return NewDashboardEntry();
          },
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SharedViews.init(context);
    return Scaffold(
      body: StreamBuilder<bool>(
        initialData: false,
        stream: splashBloc.videoPlayerInitController.stream,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return OverallErrorScreen(
              onRetry: () {},
            );
          }
          return Center(
            child: snapshot.hasData && snapshot.data!
                ? AspectRatio(
                    aspectRatio: splashBloc.controller.value.aspectRatio,
                    child: VideoPlayer(splashBloc.controller),
                  )
                : Container(
                    color: Colors.amber,
                  ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    splashBloc.dispose();
  }
}
