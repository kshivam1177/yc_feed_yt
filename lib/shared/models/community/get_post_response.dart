// To parse this JSON data, do
//
//     final getPostResponse = getPostResponseFromJson(jsonString);

import 'dart:convert';

import 'package:yc_app/shared/models/community/post.model.dart';

import '../image.model.dart';

GetPostResponse getPostResponseFromJson(String str) =>
    GetPostResponse.fromJson(json.decode(str));

String getPostResponseToJson(GetPostResponse data) =>
    json.encode(data.toJson());

class GetPostResponse {
  GetPostResponse({
    this.getPost,
  });

  Post? getPost;

  factory GetPostResponse.fromJson(Map<String, dynamic> json) =>
      GetPostResponse(
        getPost:
            json["getPost"] == null ? null : Post.fromJson(json["getPost"]),
      );

  Map<String, dynamic> toJson() => {
        "getPost": getPost == null ? null : getPost!.toJson(),
      };
}

class GetPost {
  GetPost({
    this.entity,
    this.id,
    this.caption,
    this.status,
    this.postType,
    this.blogContent,
    this.likesCount,
    this.adLink,
    this.user,
    this.profiles,
    this.createdAt,
    this.media,
    this.getPostClass,
    this.isLiked,
    this.feedbackDate,
    this.feedbackText,
    this.feedbackBy,
  });

  dynamic entity;
  String? id;
  String? caption;
  String? status;
  String? postType;
  String? blogContent;
  int? likesCount;
  dynamic adLink;
  User? user;
  List<Profile>? profiles;
  DateTime? createdAt;
  List<dynamic>? media;
  dynamic getPostClass;
  dynamic isLiked;
  dynamic feedbackDate;
  dynamic feedbackText;
  dynamic feedbackBy;

  factory GetPost.fromJson(Map<String, dynamic> json) => GetPost(
        entity: json["entity"],
        id: json["id"],
        caption: json["caption"],
        status: json["status"],
        postType: json["postType"],
        blogContent: json["blogContent"],
        likesCount: json["likesCount"],
        adLink: json["adLink"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        profiles: json["profiles"] == null
            ? null
            : List<Profile>.from(
                json["profiles"].map((x) => Profile.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        media: json["media"] == null
            ? null
            : List<dynamic>.from(json["media"].map((x) => x)),
        getPostClass: json["class"],
        isLiked: json["isLiked"],
        feedbackDate: json["feedbackDate"],
        feedbackText: json["feedbackText"],
        feedbackBy: json["feedbackBy"],
      );

  Map<String, dynamic> toJson() => {
        "entity": entity,
        "id": id,
        "caption": caption,
        "status": status,
        "postType": postType,
        "blogContent": blogContent,
        "likesCount": likesCount,
        "adLink": adLink,
        "user": user == null ? null : user!.toJson(),
        "profiles": profiles == null
            ? null
            : List<dynamic>.from(profiles!.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "media":
            media == null ? null : List<dynamic>.from(media!.map((x) => x)),
        "class": getPostClass,
        "isLiked": isLiked,
        "feedbackDate": feedbackDate,
        "feedbackText": feedbackText,
        "feedbackBy": feedbackBy,
      };
}

class Profile {
  Profile({
    this.id,
    this.fullName,
    this.profilePic,
  });

  String? id;
  String? fullName;
  ProfilePic? profilePic;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"] == null ? null : json["id"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        profilePic: json["profilePic"] == null
            ? null
            : ProfilePic.fromJson(json["profilePic"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "fullName": fullName == null ? null : fullName,
        "profilePic": profilePic == null ? null : profilePic!.toJson(),
      };
}

class ProfilePic {
  ProfilePic({
    this.id,
    this.url,
  });

  dynamic id;
  String? url;

  factory ProfilePic.fromJson(Map<String, dynamic> json) => ProfilePic(
        id: json["id"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url == null ? null : url,
      };
}

class User {
  User({
    this.id,
    this.fullName,
    this.profilePic,
    this.isUserAChild,
    this.relationship,
  });

  String? id;
  String? fullName;
  dynamic profilePic;
  bool? isUserAChild;
  String? relationship;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        profilePic: json["profilePic"],
        isUserAChild:
            json["isUserAChild"] == null ? null : json["isUserAChild"],
        relationship:
            json["relationship"] == null ? null : json["relationship"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "fullName": fullName == null ? null : fullName,
        "profilePic": profilePic,
        "isUserAChild": isUserAChild == null ? null : isUserAChild,
        "relationship": relationship == null ? null : relationship,
      };
}


class PostProfile {
  String? id;
  String? fullName;
  ImageModel? profilePic;

  PostProfile({
    this.id,
    this.fullName,
    this.profilePic,
  });

  PostProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    profilePic = json['profilePic'] == null
        ? null
        : ImageModel.fromMap(json['profilePic']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['profilePic'] = this.profilePic!.toMap();
    return data;
  }
}
