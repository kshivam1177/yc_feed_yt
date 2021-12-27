import 'package:flutter/material.dart';
import 'package:yc_app/blocs/community_bloc.dart';
import 'package:yc_app/modules/community/social_feed.dart';

class SocialFeedScreenEntry extends StatefulWidget {
  final int initialIndex;

  SocialFeedScreenEntry({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _SocialFeedScreenEntryState createState() => _SocialFeedScreenEntryState();
}

class _SocialFeedScreenEntryState extends State<SocialFeedScreenEntry> {
  Future<void> getData() async {
    communityBloc.allFeedPosts = [];
    communityBloc.allMyPosts = [];
    communityBloc.getFeeds();
  }

  @override
  void dispose() {
    communityBloc.pageCount = 0;
    communityBloc.showYouAreAllCaughtUp = false;
    super.dispose();
  }

  @override
  void initState() {
    communityBloc.pageCount = 0;
    communityBloc.showYouAreAllCaughtUp = false;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SocialFeed(
      initialIndex: widget.initialIndex,
    );
  }
}
