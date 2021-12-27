import 'dart:async';
import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';
import 'package:yc_app/shared/resources/repository/community_repository.dart';

import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/constants.dart';
import 'package:yc_app/utils/endpoints.dart';
import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/models/community/delete_post_input.model.dart';
import 'package:yc_app/shared/models/community/feeds_input.model.dart';
import 'package:yc_app/shared/models/community/get_feeds_response.model.dart';
import 'package:yc_app/shared/models/community/get_my_posts_response.model.dart';
import 'package:yc_app/shared/models/community/like_post_input.model.dart';
import 'package:yc_app/shared/models/community/my_posts_input.model.dart';
import 'package:yc_app/shared/models/community/post.model.dart';
import 'package:yc_app/shared/models/community/report_post_input.model.dart';
import 'package:yc_app/shared/models/community/post_timespent.model.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/models/community/get_post_input.model.dart';
import 'package:yc_app/shared/models/likes_list.model.dart';

import 'package:yc_app/blocs/base_bloc.dart';

class CommunityBloc implements BaseBloc {
  BehaviorSubject<bool?> loadingController =
      BehaviorSubject<bool?>.seeded(false);
  BehaviorSubject<bool> myPostLoadingController =
      BehaviorSubject<bool>.seeded(true);
  BehaviorSubject<bool> likeLoadingController =
      BehaviorSubject<bool>.seeded(false);
  List<Post> allFeedPosts = [];
  List<Post> allMyPosts = [];
  late bool itIsMyPost;
  Post? getCurrentPost;
  StreamController<GetFeedsResponse> getFeedsController =
      StreamController<GetFeedsResponse>.broadcast();
  StreamController<bool> reloadController = StreamController<bool>.broadcast();

  StreamController<GetMyPostsResponse> getMyPostsController =
      StreamController<GetMyPostsResponse>.broadcast();
  VideoPlayerController? controller;
  ScrollController? scrollController;
  int? feedLength;
  int pageCount = 0;
  bool showYouAreAllCaughtUp = false;
  bool apiCalled = false;
  Post? post;
  int currentPage = 0;
  double likeButtonSize = 24;
  double mainLikeButtonSize = 50;
  double mainLikeButtonOpacity = 0;
  List<String>? specialPostIds;
  BehaviorSubject<bool> feedHeaderController =
      BehaviorSubject<bool>.seeded(false);

  // Function to get feed posts
  Future<void> getFeeds(
      {bool showLoader = true, bool pullToRefresh = false}) async {
    if (!showYouAreAllCaughtUp) {
      if (showLoader == true) {
        loadingController.add(true);
      }
      apiCalled = true;
      ApiState<dynamic> state = await communityRepository.getFeeds(
        feedsInput: FeedsInput(
          page: pageCount + 1,
          specialPostIds: specialPostIds,
        ),
      );

      if (state is SuccessState) {
        List<Post> response = state.value.getFeeds;
        if (response.isEmpty) {
          this.showYouAreAllCaughtUp = true;
          loadingController.add(false);
          return;
        }
        pageCount++;
        feedLength = response.length;
        allFeedPosts.addAll(response);
        loadingController.add(false);
      } else if (state is ErrorState) {
        loadingController.sink.addError(state.error);
      }
      apiCalled = false;
    }
  }

  //Function to get feed posts
  Future<void> getMyPosts(
      {int skip = 0, int limit = 20, bool showLoader = true}) async {
    if (showLoader) {
      myPostLoadingController.add(true);
    }
    apiCalled = true;
    ApiState<dynamic> state = await communityRepository.getMyPosts(
      myPostsInput: MyPostsInput(
        skip: skip,
        limit: limit,
      ),
    );
    if (state is SuccessState) {
      List<Post> response = state.value.getMyPosts as List<Post>;
      if (response.isEmpty) {
        this.showYouAreAllCaughtUp = true;
        myPostLoadingController.add(false);
        return;
      }
      allMyPosts.addAll(
        state.value.getMyPosts,
      );
      myPostLoadingController.add(false);
    } else if (state is ErrorState) {
      loadingController.sink.addError(state.error);
    }
    apiCalled = false;
  }

  void likePost(
      {String? postId, int? index, bool navigatedViaDeepLink = false}) async {
    likeLoadingController.add(true);
    ApiState<dynamic> state = await communityRepository.likePost(
      likePostInput: LikePostInput(postId: postId),
    );
    if (state is SuccessState) {
      if (navigatedViaDeepLink) {
        communityBloc.post!.isLiked = true;
      }
      likeLoadingController.add(false);
    } else if (state is ErrorState) {
      if (navigatedViaDeepLink) {
        communityBloc.post!.isLiked = false;
      }
      likeLoadingController.addError(state.error);
    }
  }

  BehaviorSubject<List<LikedBy>?> likesListController =
      BehaviorSubject<List<LikedBy>?>.seeded(null);
  LikesListResponse? likesListResponse;
  String? lastLikeId;
  bool hasListEnded = false;
  bool apiCallInProgress = false;
  List<LikedBy> likesList = <LikedBy>[];
  String? postId = null;

  Future<void> initialiseLikesListState({bool showLoader: true}) async {
    lastLikeId = null;
    likesListResponse = null;
    likesList.clear();
    hasListEnded = false;
    apiCallInProgress = false;
    await getLikesList(showLoader: showLoader);
  }

  Future<void> getLikesList({bool showLoader = true}) async {
    apiCallInProgress = true;
    if (showLoader) {
      likesListController.sink.add(null);
    }
    ApiState<dynamic> state = await communityRepository.likesList(
        likesListRequest: LikesListRequest(
            postId: postId, lastLikeId: lastLikeId, limit: 20));
    if (state is SuccessState) {
      likesListResponse = state.value;
      lastLikeId = likesListResponse!.getLikesOnPost!.likedBy!.length != 0
          ? likesListResponse!.getLikesOnPost!.lastLikeId
          : lastLikeId;
      likesList.addAll(likesListResponse!.getLikesOnPost!.likedBy!);
      hasListEnded = likesListResponse!.getLikesOnPost!.totalLikesOnPost ==
          likesList.length;
      likesListController.sink.add(likesList);
    } else if (state is ErrorState) {
      likesListController.addError(state.error);
    }
    apiCallInProgress = false;
  }

  Future<void> getPost({String? id}) async {
    loadingController.add(true);
    ApiState<dynamic> state = await communityRepository.getPost(
      getPostInput: GetPostInput(id: id),
    );
    if (state is SuccessState) {
      if (state.value.getPost == null) {
        loadingController.addError("null post");
        return;
      }
      communityBloc.post = null;
      communityBloc.post = state.value.getPost;
    } else if (state is ErrorState) {
      SharedViews.showToast(msg: SOME_ERROR_OCCURRED);
      loadingController.addError(state.error);
    }
    loadingController.add(false);
  }

  void initPlayer({required String url}) {
    controller = VideoPlayerController.network(url);
    controller!.initialize();
  }

  void play() {
    controller?.play();
  }

  // CODE: PAUSES VIDEO ,PAUSE WAS USED BECAUSE THE STOP FUNCTION IS PACKAGE PRIVATE
  void stop() {
    controller?.pause();
  }

  Future<void> getData(
      {bool pullToRefresh = false, required bool isFeed}) async {
    communityBloc.specialPostIds = null;
    communityBloc.pageCount = 0;
    this.showYouAreAllCaughtUp = false;
    communityBloc.loadingController.add(true);
    if (!isFeed) {
      communityBloc.allMyPosts = [];
      await communityBloc.getMyPosts(showLoader: pullToRefresh);
    } else {
      communityBloc.allFeedPosts = [];
      await communityBloc.getFeeds(
        showLoader: true,
        pullToRefresh: pullToRefresh,
      );
    }
  }

  @override
  void dispose() {
    likeLoadingController.close();
    loadingController.close();
    myPostLoadingController.close();
    controller?.dispose();
    // getMyPostsController.close();
    getFeedsController.close();
    getMyPostsController.close();
    reloadController.close();
  }

  void animate2Top() {
    if (this.scrollController != null) {
      this.scrollController!.animateTo(0.0,
          duration: Duration(milliseconds: 400), curve: Curves.fastOutSlowIn);
    }
  }

  void initializeItemScrollController() {
    this.scrollController = ScrollController();
    this.scrollController!.addListener(() {});
  }
}

final CommunityBloc communityBloc = CommunityBloc();
