class MyPostsInput {
  int? skip;
  int? limit;

  MyPostsInput({
    this.skip,
    this.limit,
  });

  MyPostsInput.fromJson(Map<String, dynamic> json) {
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}
