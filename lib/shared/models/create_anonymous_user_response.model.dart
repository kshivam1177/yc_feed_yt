import 'dart:convert';

import 'package:yc_app/shared/models/user/user.model.dart';

class CreateAnonymousResponse {
  CreateAnonymousResponse({this.createAnonymousUser});

  AnonymousUser? createAnonymousUser;

  factory CreateAnonymousResponse.fromMap(Map<String, dynamic> json) =>
      CreateAnonymousResponse(
        createAnonymousUser: json["createAnonymousUser"] == null
            ? null
            : AnonymousUser.fromMap(json["createAnonymousUser"]),
      );

  Map<String, dynamic> toMap() => {
        "createAnonymousUser":
            createAnonymousUser == null ? null : createAnonymousUser!.toMap(),
      };
}

class AnonymousUser {
  String? userId;
  String? profileId;
  String? myExpBucket;
  User? user;

  AnonymousUser({
    this.userId,
    this.profileId,
    this.myExpBucket,
    this.user,
  });

  AnonymousUser copyWith({
    String? userId,
    String? profileId,
    String? myExpBucket,
    User? user,
  }) {
    return AnonymousUser(
      userId: userId ?? this.userId,
      profileId: profileId ?? this.profileId,
      myExpBucket: myExpBucket ?? this.myExpBucket,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'profileId': profileId,
      'MYExpBucket': myExpBucket,
      'user': user?.toMap(),
    };
  }

  factory AnonymousUser.fromMap(Map<String, dynamic> map) {
    return AnonymousUser(
      userId: map['userId'] != null ? map['userId'] : null,
      profileId: map['profileId'] != null ? map['profileId'] : null,
      myExpBucket: map['MYExpBucket'] != null ? map['MYExpBucket'] : null,
      user: map['user'] != null ? User.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnonymousUser.fromJson(String source) =>
      AnonymousUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnonymousUser(userId: $userId, profileId: $profileId, MYExpBucket: $myExpBucket, user: $user )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnonymousUser &&
        other.userId == userId &&
        other.profileId == profileId &&
        other.myExpBucket == myExpBucket &&
        other.user == user;
  }
}
