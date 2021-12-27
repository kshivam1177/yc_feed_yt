import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yc_app/blocs/base_bloc.dart';
import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/models/create_anonymous_user_response.model.dart';
import 'package:yc_app/shared/resources/api_provider/auth_api_provider.dart';
import 'package:yc_app/shared/services/shared_preferences_service.dart';

class SplashBloc extends BaseBloc {
  late VideoPlayerController controller;
  StreamController<bool> videoPlayerInitController =
      StreamController<bool>.broadcast();

  SplashBloc() {
    initSplashVideo();
  }

  void initSplashVideo() {
    controller = VideoPlayerController.asset('assets/videos/splash.mp4')
      ..initialize().then((_) {
        if (controller.value.isInitialized) {
          controller.setVolume(0.0);
          controller.play();
          videoPlayerInitController.add(controller.value.isInitialized);
        }
      });
  }

  Future<bool> getAnonymousUser() async {
    //CHECKS IF ANONYMOUS USER EXISTS, ELSE CREATES
    if (sharedPreferenceService.containsAnonymousUserData &&
        sharedPreferenceService.anonymousUserData.userId != null &&
        sharedPreferenceService.anonymousUserData.profileId != null ) {
      return true;
    }
    ApiState<dynamic> state = await apiProvider.createAnonymousUser();
    if (state is SuccessState) {
      AnonymousUser? anonymousUser = state.value?.createAnonymousUser;

      if (anonymousUser?.userId == null || anonymousUser?.profileId == null) {
        return false;
      }

      sharedPreferenceService.setContentDashVariation(anonymousUser!.myExpBucket);
      if (sharedPreferenceService.containsAnonymousUserData) {
        await sharedPreferenceService.removeAnonymousUserData();
      }
      await sharedPreferenceService.setAnonymousUserData(anonymousUser);
      return true;
    } else if (state is ErrorState) {
      return false;
    }
    return false;
  }

  @override
  void dispose() {
    videoPlayerInitController.close();
    controller.dispose();
  }
}
