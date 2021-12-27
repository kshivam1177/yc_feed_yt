
import 'package:yc_app/shared/models/community/entity.model.dart';
import 'package:yc_app/shared/models/community/post_admin.model.dart';
import 'package:yc_app/shared/models/media.model.dart';
import 'package:yc_app/shared/models/user/user.model.dart';

enum PostType {
  USER,
  ADMIN,
  ADCARD,
  BLOG,
  RECENT_CLASS,
  UPCOMING_CLASS,
  HOOK1,
}

extension PostTypeToStringExtension on PostType? {
  String? get string {
    switch (this) {
      case PostType.USER:
        return 'USER';
      case PostType.ADMIN:
        return 'ADMIN';
      case PostType.ADCARD:
        return 'ADCARD';
      case PostType.BLOG:
        return 'BLOG';
      case PostType.RECENT_CLASS:
        return 'RECENT_CLASS';
      case PostType.UPCOMING_CLASS:
        return 'UPCOMING_CLASS';
      case PostType.HOOK1:
        return 'HOOK1';
      default:
        return null;
    }
  }
}

PostType? postTypefromString(String? type) {
  switch (type) {
    case "USER":
      return PostType.USER;
    case "ADMIN":
      return PostType.ADMIN;
    case "BLOG":
      return PostType.BLOG;
    case "ADCARD":
      return PostType.ADCARD;
    case "RECENT_CLASS":
      return PostType.RECENT_CLASS;
    case "UPCOMING_CLASS":
      return PostType.UPCOMING_CLASS;
    case "HOOK1":
      return PostType.HOOK1;
    default:
      return null;
  }
}

class ClickAction {
  final String? clickActionType;
  final String? clickActionUrl;

  ClickAction({
    this.clickActionType,
    this.clickActionUrl,
  });

  factory ClickAction.fromMap(Map<String, dynamic> json) {
    return ClickAction(
      clickActionType: json['clickActionType'],
      clickActionUrl: json['clickActionUrl'],
    );
  }

  Map<String, dynamic> toMap() => {
        "clickActionType": clickActionType == null ? null : clickActionType,
        "clickActionUrl": clickActionUrl == null ? null : clickActionUrl,
      };
}

class Post {
  String? id;
  String? caption;
  String? status;
  // Course course;
  Entity? entity;
  PostType? postType;
  String? hookImageUrl;
  ClickAction? clickAction;
  String? blogContent;
  int? likesCount;
  String? adLink;
  User? user;
  DateTime? createdAt;
  List<Medias>? media;
  bool? isLiked;
  String? feedbackDate;
  String? feedbackText;
  PostFeedbackBy? feedbackBy;

  Post({
    this.id,
    this.caption,
    this.status,
    this.entity,
    this.likesCount,
    this.adLink,
    this.user,
    this.createdAt,
    this.media,
    this.postType,
    this.hookImageUrl,
    this.clickAction,
    this.isLiked,
    this.feedbackDate,
    this.feedbackText,
    this.feedbackBy,
    this.blogContent,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'],
        caption: json['caption'],
        status: json['status'],
        entity: json["entity"] == null ? null : Entity.fromJson(json["entity"]),
        // course:
        //     json['course'] != null ? Course.fromJson(json['course']) : null,
        postType: postTypefromString(json["postType"]),
        hookImageUrl: json["hookImageUrl"],
        clickAction: json["clickAction"] == null
            ? null
            : ClickAction.fromMap(json["clickAction"]),
        likesCount: json['likesCount'],
        blogContent: json['blogContent'],
        isLiked: json['isLiked'],
        adLink: json['adLink'],
        user: json['user'] != null ? User.fromMap(json['user']) : null,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        media: json['media'] == null
            ? null
            : (json['media'] as List).map((e) => Medias.fromJson(e)).toList(),
        feedbackDate: json['feedbackDate'],
        feedbackText: json['feedbackText'],
        feedbackBy: json["feedbackBy"] == null
            ? null
            : PostFeedbackBy.fromJson(json["feedbackBy"]),

      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['caption'] = this.caption;
    data['status'] = this.status;
    data['entity'] = this.entity;
    data['class'] = this.entity;
    // if (this.course != null) {
    //   data['course'] = this.course.toJson();
    // }
    data['postType'] = this.postType.string;
    data['hookImageUrl'] = this.hookImageUrl;
    data['clickAction'] = this.clickAction;
    data['likesCount'] = this.likesCount;
    data['adLink'] = this.adLink;
    if (this.user != null) {
      data['user'] = this.user!.toMap();
    }
    data['isLiked'] = this.isLiked;
    data['feedbackDate'] = this.feedbackDate;
    data['feedbackText'] = this.feedbackText;
    data['feedbackBy'] = this.feedbackBy;
    data['createdAt'] = this.createdAt!.toIso8601String();
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    // TODO: Add class toJson
    return data;
  }

}
