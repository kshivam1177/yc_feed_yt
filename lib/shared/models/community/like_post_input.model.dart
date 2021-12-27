class LikePostInput {
  String? postId;

  LikePostInput({this.postId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['postId'] = this.postId;
    return data;
  }
}
