class PostFeedbackBy {
  PostFeedbackBy({this.fullName, this.profilePic, this.gender});

  String? fullName;
  String? profilePic;
  String? gender;

  factory PostFeedbackBy.fromJson(Map<String, dynamic> json) => PostFeedbackBy(
        fullName: json["fullName"] == null ? null : json["fullName"],
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
        gender: json["gender"] == null ? null : json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName == null ? null : fullName,
        "profilePic": profilePic == null ? null : profilePic,
        "gender": gender == null ? null : gender,
      };
}
