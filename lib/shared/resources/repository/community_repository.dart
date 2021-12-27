import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/models/community/feeds_input.model.dart';
import 'package:yc_app/shared/models/community/get_post_input.model.dart';
import 'package:yc_app/shared/models/community/like_post_input.model.dart';
import 'package:yc_app/shared/models/community/my_posts_input.model.dart';
import 'package:yc_app/shared/models/likes_list.model.dart';
import 'package:yc_app/shared/resources/api_provider/community_api_provider.dart';

class CommunityRepository {
  final communityApiProvider = CommunityApiProvider();

  ///getFeeds
  Future<ApiState> getFeeds({required FeedsInput feedsInput}) =>
      communityApiProvider.getFeeds(feedsInput: feedsInput);

  Future<ApiState> getPost({required GetPostInput getPostInput}) =>
      communityApiProvider.getPost(getPostInput: getPostInput);


  Future<ApiState> getMyPosts({required MyPostsInput myPostsInput}) =>
      communityApiProvider.getMyPosts(myPostsInput: myPostsInput);


  Future<ApiState> likePost({required LikePostInput likePostInput}) =>
      communityApiProvider.likePost(likePostInput: likePostInput);

  Future<ApiState> likesList({required LikesListRequest likesListRequest}) =>
      communityApiProvider.likesList(likesListRequest: likesListRequest);

}

final communityRepository = CommunityRepository();