import 'package:yc_app/shared/models/community/post.model.dart';

class GetFeedsResponse {
  List<Post>? getFeeds;

  GetFeedsResponse({this.getFeeds});

  factory GetFeedsResponse.fromJson(Map<String, dynamic> json) =>
      GetFeedsResponse(
          getFeeds: json['getFeeds'] == null
              ? null
              : (json['getFeeds'] as List)
                  .map((e) => Post.fromJson(e))
                  .toList());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.getFeeds != null) {
      data['getFeeds'] = this.getFeeds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
