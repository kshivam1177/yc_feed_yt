import 'dart:convert';

import 'package:yc_app/shared/models/image.model.dart';

class User {
  User({
    this.id,
    this.fullName,
    this.onboardingStatus,
    this.email,
    this.emailVerified,
    this.relationship,
    this.isUserAChild,
    this.profilePic,
    this.mobile,
    this.photos,
    this.role,
    this.premiumValidTill,
    this.defaultVideoQuality,
    this.hasAttendedClass,
    this.hasRedeemedRefCode,
    this.initialBoltsGranted,
    this.initialGemsGranted,
    this.isUserCreatedAfterTracksRelease,
    this.hasParentConsentToPost = false,
    this.myExpBucket,
  });

  String? id;
  String? fullName;
  int? onboardingStatus;
  List<String>? email;
  bool? emailVerified;
  String? relationship;
  bool? isUserAChild;
  ImageModel? profilePic;
  String? mobile;
  List<ImageModel>? photos;
  String? role;
  String? defaultVideoQuality;
  DateTime? premiumValidTill;
  bool? hasAttendedClass;
  bool? hasRedeemedRefCode;
  bool? isUserCreatedAfterTracksRelease;
  bool hasParentConsentToPost;
  String? myExpBucket;
  bool? initialGemsGranted;
  bool? initialBoltsGranted;

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map["id"],
        fullName: map["fullName"],
        onboardingStatus: map["onboardingStatus"],
        email: map["email"] == null
            ? null
            : List<String>.from(map["email"].map((x) => x)),
        premiumValidTill: map["premiumValidTill"] == null
            ? null
            : DateTime.parse(map["premiumValidTill"]),
        emailVerified: map["emailVerified"],
        hasAttendedClass:
            map["hasAttendedClass"] == null ? false : map['hasAttendedClass'],
        hasRedeemedRefCode: map["hasRedeemedRefCode"] == null
            ? false
            : map['hasRedeemedRefCode'],
        isUserCreatedAfterTracksRelease:
            map["isUserCreatedAfterTracksRelease"] == null
                ? false
                : map['isUserCreatedAfterTracksRelease'],
        myExpBucket:
            map["MYExpBucket"] == null ? "REGULAR" : map['MYExpBucket'],
        relationship: map["relationship"],
        isUserAChild: map["isUserAChild"],
        defaultVideoQuality: map["defaultVideoQuality"],
        profilePic: map["profilePic"] == null
            ? null
            : ImageModel.fromMap(map["profilePic"]),
        mobile: map["mobile"],
        photos: map["photos"] == null
            ? null
            : List<ImageModel>.from(map["photos"].map((x) => ImageModel.fromMap(x))),
        role: map["role"],
        initialBoltsGranted: map["initialBoltsGranted"] ?? false,
        initialGemsGranted: map["initialGemsGranted"] ?? false,
        hasParentConsentToPost: map["hasParentConsentToPost"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fullName": fullName,
        "onboardingStatus": onboardingStatus,
        "email":
            email == null ? null : List<dynamic>.from(email!.map((x) => x)),
        "emailVerified": emailVerified,
        "relationship": relationship,
        "isUserAChild": isUserAChild,
        "defaultVideoQuality": defaultVideoQuality,
        "profilePic": profilePic == null ? null : profilePic!.toMap(),
        "mobile": mobile,
        "photos": photos == null
            ? null
            : List<dynamic>.from(photos!.map((x) => x.toMap())),
        "role": role,
        "hasAttendedClass": hasAttendedClass,
        "isUserCreatedAfterTracksRelease": isUserCreatedAfterTracksRelease,
        "hasRedeemedRefCode": hasRedeemedRefCode,
        "initialGemsGranted": initialGemsGranted,
        "initialBoltsGranted": initialBoltsGranted,
        "hasParentConsentToPost": hasParentConsentToPost,
        "premiumValidTill": premiumValidTill == null
            ? null
            : premiumValidTill!.toIso8601String()
      };

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));



  User copyWith({
    String? id,
    String? fullName,
    int? onboardingStatus,
    List<String>? email,
    bool? emailVerified,
    String? relationship,
    bool? isUserAChild,
    ImageModel? profilePic,
    String? mobile,
    List<ImageModel>? photos,
    String? role,
    String? defaultVideoQuality,
    DateTime? premiumValidTill,
    bool? hasAttendedClass,
    bool? hasRedeemedRefCode,
    bool? isUserCreatedAfterTracksRelease,
    bool? hasParentConsentToPost,
    String? myExpBucket,
    bool? initialGemsGranted,
    bool? initialBoltsGranted,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      onboardingStatus: onboardingStatus ?? this.onboardingStatus,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      relationship: relationship ?? this.relationship,
      isUserAChild: isUserAChild ?? this.isUserAChild,
      profilePic: profilePic ?? this.profilePic,
      mobile: mobile ?? this.mobile,
      photos: photos ?? this.photos,
      role: role ?? this.role,
      defaultVideoQuality: defaultVideoQuality ?? this.defaultVideoQuality,
      premiumValidTill: premiumValidTill ?? this.premiumValidTill,
      hasAttendedClass: hasAttendedClass ?? this.hasAttendedClass,
      hasRedeemedRefCode: hasRedeemedRefCode ?? this.hasRedeemedRefCode,
      isUserCreatedAfterTracksRelease: isUserCreatedAfterTracksRelease ??
          this.isUserCreatedAfterTracksRelease,
      hasParentConsentToPost:
          hasParentConsentToPost ?? this.hasParentConsentToPost,
      myExpBucket: myExpBucket ?? this.myExpBucket,
      initialGemsGranted: initialGemsGranted ?? this.initialGemsGranted,
      initialBoltsGranted: initialBoltsGranted ?? this.initialBoltsGranted,
    );
  }
}
