import 'package:yc_app/shared/models/community/post.model.dart';

class GetMyPostsResponse {
  List<Post>? getMyPosts;

  GetMyPostsResponse({this.getMyPosts});

  factory GetMyPostsResponse.fromJson(Map<String, dynamic> json) =>
      GetMyPostsResponse(
          getMyPosts: json['getMyPosts'] == null
              ? null
              : (json['getMyPosts'] as List)
                  .map((e) => Post.fromJson(e))
                  .toList());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.getMyPosts != null) {
      data['getMyPosts'] = this.getMyPosts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
