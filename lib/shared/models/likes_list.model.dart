class LikesListRequest {
  LikesListRequest({
    this.postId,
    this.lastLikeId,
    this.limit,
  });

  String? postId;
  String? lastLikeId;
  int? limit;

  Map<String, dynamic> toMap() => {
        "postId": postId,
        "lastLikeId": lastLikeId,
        "limit": limit,
      };
}

class LikesListResponse {
  LikesListResponse({
    this.getLikesOnPost,
  });

  LikesListOnPost? getLikesOnPost;

  factory LikesListResponse.fromMap(Map<String, dynamic> json) =>
      LikesListResponse(
        getLikesOnPost: json["getLikesOnPost"] == null
            ? null
            : LikesListOnPost.fromMap(json["getLikesOnPost"]),
      );
}

class LikesListOnPost {
  LikesListOnPost({
    this.likedBy,
    this.lastLikeId,
    this.totalLikesOnPost,
  });

  List<LikedBy>? likedBy;
  String? lastLikeId;
  int? totalLikesOnPost;

  factory LikesListOnPost.fromMap(Map<String, dynamic> json) => LikesListOnPost(
        likedBy: json["likedBy"] == null
            ? null
            : List<LikedBy>.from(
                json["likedBy"].map((x) => LikedBy.fromMap(x))),
        lastLikeId: json["lastLikeId"],
        totalLikesOnPost: json["totalLikesOnPost"],
      );
}

class LikedBy {
  LikedBy({
    this.fullName,
    this.profilePic,
    this.relationship,
  });

  String? fullName;
  ProfilePic? profilePic;
  String? relationship;

  factory LikedBy.fromMap(Map<String, dynamic> json) => LikedBy(
        fullName: json["fullName"],
        profilePic: json["profilePic"] == null
            ? null
            : ProfilePic.fromMap(json["profilePic"]),
        relationship: json["relationship"],
      );
}

class ProfilePic {
  ProfilePic({
    this.id,
    this.url,
  });

  String? id;
  String? url;

  factory ProfilePic.fromMap(Map<String, dynamic> json) => ProfilePic(
        id: json["id"],
        url: json["url"],
      );
}
