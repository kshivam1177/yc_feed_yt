import 'package:yc_app/shared/models/image.model.dart';

class PreLoginHomepageResponse {
  PreLoginHomepageResponse({
    this.getContentAnalytics,
    this.getFeaturedMentors,
    this.getCategories,
    this.getLandingPageHooks,
    this.getLandingPageLiveClasses,
    this.getBanner,
  });

  GetContentAnalytics? getContentAnalytics;
  List<Mentor>? getFeaturedMentors;
  List<GetCategory>? getCategories;
  GetLandingPageHooks? getLandingPageHooks;
  List<ClassCardModel>? getLandingPageLiveClasses;
  BannerModel? getBanner;

  factory PreLoginHomepageResponse.fromJson(Map<String, dynamic> json) =>
      PreLoginHomepageResponse(
        getContentAnalytics: json["getContentAnalytics"] == null
            ? null
            : GetContentAnalytics.fromJson(json["getContentAnalytics"]),
        getFeaturedMentors: json["getFeaturedMentors"] == null
            ? null
            : List<Mentor>.from(
                json["getFeaturedMentors"].map((x) => Mentor.fromMap(x))),
        getCategories: json["getCategories"] == null
            ? null
            : List<GetCategory>.from(
                json["getCategories"].map((x) => GetCategory.fromJson(x))),
        getLandingPageHooks: json["getLandingPageHooks"] == null
            ? null
            : GetLandingPageHooks.fromJson(json["getLandingPageHooks"]),
        getLandingPageLiveClasses:
            json["v1getLandingPageClassesWithBanner"]["cards"] == null
                ? null
                : List<ClassCardModel>.from(
                    json["v1getLandingPageClassesWithBanner"]["cards"]
                        .map((x) => ClassCardModel.fromMap(x))),
        getBanner:
            json['v1getLandingPageClassesWithBanner']['bannerDetails'] == null
                ? null
                : BannerModel.fromJson(
                    json['v1getLandingPageClassesWithBanner']['bannerDetails']),
      );
}

class BannerModel {
  String? title;
  String? subtitle;
  String? ctaText;
  String? ctaUrl;
  String? backgroundImageWebUrl;
  String? backgroundImageMobileUrl;
  String? backgroundColor;

  BannerModel({
    this.title,
    this.subtitle,
    this.ctaText,
    this.ctaUrl,
    this.backgroundImageWebUrl,
    this.backgroundImageMobileUrl,
    this.backgroundColor,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    ctaText = json['ctaText'];
    ctaUrl = json['ctaUrl'];
    backgroundImageWebUrl = json['backgroundImageWebUrl'];
    backgroundImageMobileUrl = json['backgroundImageMobileUrl'];
    backgroundColor = json['backgroundColor'];
  }
}

class GetCategory {
  GetCategory({
    this.id,
    this.title,
    this.displayTitle,
    this.animationUrl,
    this.programs,
    this.image,
    this.color,
  });

  String? id;
  String? title;
  String? displayTitle;
  String? animationUrl;
  List<ClassCardModel>? programs;
  ImageModel? image;
  String? color;

  factory GetCategory.fromJson(Map<String, dynamic> json) => GetCategory(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        displayTitle:
            json["displayTitle"] == null ? null : json["displayTitle"],
        animationUrl:
            json["animationUrl"] == null ? null : json["animationUrl"],
        programs: json["programs"] == null
            ? null
            : List<ClassCardModel>.from(json["programs"]
                .map((x) => x == null ? null : ClassCardModel.fromMap(x))),
        image: json["image"] == null ? null : ImageModel.fromMap(json["image"]),
        color: json["color"] == null ? null : json["color"],
      );
}

enum MembershipType { FREE, PREMIUM }

final membershipTypeValues = EnumValues(
    {"FREE": MembershipType.FREE, "PREMIUM": MembershipType.PREMIUM});

class GetContentAnalytics {
  GetContentAnalytics({
    this.learnersPerSec,
    this.baseLearners,
    this.minutesPerSec,
    this.baseMinutes,
    this.dateTime,
  });

  double? learnersPerSec;
  int? baseLearners;
  double? minutesPerSec;
  int? baseMinutes;
  DateTime? dateTime;

  factory GetContentAnalytics.fromJson(Map<String, dynamic> json) =>
      GetContentAnalytics(
        learnersPerSec: json["learnersPerSec"] == null
            ? null
            : json["learnersPerSec"].toDouble(),
        baseLearners:
            json["baseLearners"] == null ? null : json["baseLearners"],
        minutesPerSec: json["minutesPerSec"] == null
            ? null
            : json["minutesPerSec"].toDouble(),
        baseMinutes: json["baseMinutes"] == null ? null : json["baseMinutes"],
        dateTime:
            json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "learnersPerSec": learnersPerSec == null ? null : learnersPerSec,
        "baseLearners": baseLearners == null ? null : baseLearners,
        "minutesPerSec": minutesPerSec == null ? null : minutesPerSec,
        "baseMinutes": baseMinutes == null ? null : baseMinutes,
        "dateTime": dateTime == null ? null : dateTime!.toIso8601String(),
      };
}

class GetLandingPageHooks {
  GetLandingPageHooks({
    this.key,
    this.title,
    this.titleTextColor,
    this.sections,
    this.bgColor,
  });

  String? key;
  String? title;
  String? titleTextColor;
  List<Section>? sections;
  String? bgColor;

  factory GetLandingPageHooks.fromJson(Map<String, dynamic> json) =>
      GetLandingPageHooks(
        key: json["key"] == null ? null : json["key"],
        title: json["title"] == null ? null : json["title"],
        titleTextColor:
            json["titleTextColor"] == null ? null : json["titleTextColor"],
        sections: json["sections"] == null
            ? null
            : List<Section>.from(
                json["sections"].map((x) => Section.fromJson(x))),
        bgColor: json["bgColor"] == null ? null : json["bgColor"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "title": title == null ? null : title,
        "titleTextColor": titleTextColor == null ? null : titleTextColor,
        "sections": sections == null
            ? null
            : List<dynamic>.from(sections!.map((x) => x.toJson())),
        "bgColor": bgColor == null ? null : bgColor,
      };
}

class Section {
  Section({
    this.key,
    this.title,
    this.titleTextColor,
    this.description,
    this.bgColor,
    this.ctaType,
    this.ctaUrl,
    this.entityType,
    this.iconUrl,
    this.descriptionTextColor,
  });

  String? key;
  String? title;
  String? titleTextColor;
  String? description;
  String? bgColor;
  String? ctaType;
  String? ctaUrl;
  String? entityType;
  String? iconUrl;
  String? descriptionTextColor;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        key: json["key"] == null ? null : json["key"],
        title: json["title"] == null ? null : json["title"],
        titleTextColor:
            json["titleTextColor"] == null ? null : json["titleTextColor"],
        description: json["description"] == null ? null : json["description"],
        bgColor: json["bgColor"] == null ? null : json["bgColor"],
        ctaType: json["ctaType"] == null ? null : json["ctaType"],
        ctaUrl: json["ctaUrl"] == null ? null : json["ctaUrl"],
        entityType: json["entityType"] == null ? null : json["entityType"],
        iconUrl: json["iconUrl"] == null ? null : json["iconUrl"],
        descriptionTextColor: json["descriptionTextColor"] == null
            ? null
            : json["descriptionTextColor"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "title": title == null ? null : title,
        "titleTextColor": titleTextColor == null ? null : titleTextColor,
        "description": description == null ? null : description,
        "bgColor": bgColor == null ? null : bgColor,
        "ctaType": ctaType == null ? null : ctaType,
        "ctaUrl": ctaUrl == null ? null : ctaUrl,
        "entityType": entityType == null ? null : entityType,
        "iconUrl": iconUrl == null ? null : iconUrl,
        "descriptionTextColor":
            descriptionTextColor == null ? null : descriptionTextColor,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}

class Mentor {
  String? id;
  String? fullName;
  String? tagline;
  int? upvotesCount;
  ImageModel? profilePic;
  ImageModel? mobileCoverPic;
  bool? isMyMentor;
  bool? isFeatured;
  List<String>? specialities;
  List<String>? keyHighlights;
  String? about;
  String? gender;

  Mentor({
    this.id,
    this.fullName,
    this.tagline,
    this.upvotesCount,
    this.profilePic,
    this.mobileCoverPic,
    this.isMyMentor,
    this.isFeatured,
    this.specialities,
    this.keyHighlights,
    this.about,
    this.gender,
  });

  Mentor copyWith({
    String? id,
    String? fullName,
    String? tagline,
    int? upvotesCount,
    ImageModel? profilePic,
    ImageModel? mobileCoverPic,
    bool? isMyMentor,
    bool? isFeatured,
    List<String>? specialities,
    List<String>? keyHighlights,
    String? about,
    String? gender,
  }) {
    return Mentor(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      tagline: tagline ?? this.tagline,
      upvotesCount: upvotesCount ?? this.upvotesCount,
      profilePic: profilePic ?? this.profilePic,
      mobileCoverPic: mobileCoverPic ?? this.mobileCoverPic,
      isMyMentor: isMyMentor ?? this.isMyMentor,
      isFeatured: isFeatured ?? this.isFeatured,
      specialities: specialities ?? this.specialities,
      keyHighlights: keyHighlights ?? this.keyHighlights,
      about: about ?? this.about,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'tagline': tagline,
      'upvotesCount': upvotesCount,
      'profilePic': profilePic?.toMap(),
      'mobileCoverPic': mobileCoverPic?.toMap(),
      'isMyMentor': isMyMentor,
      'isFeatured': isFeatured,
      'specialities': specialities,
      'keyHighlights': keyHighlights,
      'about': about,
      'gender': gender,
    };
  }

  factory Mentor.fromMap(Map<String, dynamic> map) {
    return Mentor(
      id: map['id'] != null ? map['id'] : null,
      fullName: map['fullName'] != null ? map['fullName'] : null,
      tagline: map['tagline'] != null ? map['tagline'] : null,
      upvotesCount: map['upvotesCount'] != null ? map['upvotesCount'] : null,
      profilePic: map['profilePic'] != null
          ? ImageModel.fromMap(map['profilePic'])
          : null,
      mobileCoverPic: map['mobileCoverPic'] != null
          ? ImageModel.fromMap(map['mobileCoverPic'])
          : null,
      isMyMentor: map['isMyMentor'] != null ? map['isMyMentor'] : null,
      isFeatured: map['isFeatured'] != null ? map['isFeatured'] : null,
      specialities: map['specialities'] != null
          ? List<String>.from(map['specialities'])
          : null,
      keyHighlights: map['keyHighlights'] != null
          ? List<String>.from(map['keyHighlights'])
          : null,
      about: map['about'] != null ? map['about'] : null,
      gender: map['gender'] != null ? map['gender'] : null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mentor &&
        other.id == id &&
        other.fullName == fullName &&
        other.tagline == tagline &&
        other.upvotesCount == upvotesCount &&
        other.profilePic == profilePic &&
        other.mobileCoverPic == mobileCoverPic &&
        other.isMyMentor == isMyMentor &&
        other.isFeatured == isFeatured &&
        other.about == about &&
        other.gender == gender;
  }
}

class ClassCardModel {
  String? id;

  ClassCardModel({
    this.id,
    this.programId,
    this.title,
    this.href,
    this.isReminderSet,
    this.coverPicture,
    this.coverPicture3By2,
    this.coverPicture2By1,
    this.classNum,
    this.dateTime,
    this.duration,
    this.mentorName,
    this.timestamp,
    this.isClassLive,
    this.viewerCount,
    this.isClassNew,
    this.programTitle,
    this.programEnrollmentStartTime,
    this.programTypeTagText,
    this.programTypeTagBgColor,
    this.programTypeTagTextColor,
    this.programStartDate,
    this.featuredCoverUrl,
    this.attendanceInfo,
    this.attendanceText,
    this.attendanceBGColor,
    this.attendanceTextColor,
    this.watchMinutes,
    this.mentorFullName,
    this.attendanceCount,
    this.shouldShowEnrollmentPopup,
    this.numClasses,
    this.topRightLabelText,
    this.topRightLabelBgColor,
    this.topRightLabelTextColor,
    this.canEnrollInBatch,
    this.classTypeTagText,
    this.classType,
    this.classTypeColor,
    this.color,
    this.percentageWatched,
  });

  String? programId;
  String? title;
  String? href;
  bool? isReminderSet;
  ImageModel? coverPicture3By2;
  ImageModel? coverPicture;
  ImageModel? coverPicture2By1;
  ImageModel? featuredCoverUrl;
  String? classNum;
  DateTime? dateTime;
  int? duration;
  String? mentorName;
  String? mentorFullName;

  bool? isClassLive;
  String? viewerCount;
  num? attendanceCount;
  bool? isClassNew;
  String? timestamp;
  String? programTitle;
  String? programTypeTagText;
  String? programTypeTagBgColor;
  String? programTypeTagTextColor;
  DateTime? programEnrollmentStartTime;
  DateTime? programStartDate;
  String? attendanceInfo;
  String? attendanceText;
  String? attendanceBGColor;
  String? attendanceTextColor;
  num? percentageWatched;
  List<int>? watchMinutes;
  bool? shouldShowEnrollmentPopup;
  int? numClasses;
  String? topRightLabelText;
  String? topRightLabelBgColor;
  String? topRightLabelTextColor;
  bool? canEnrollInBatch;
  String? color;
  String? classTypeTagText;
  String? classType;
  String? classTypeColor;

  factory ClassCardModel.fromMap(Map<String, dynamic> map) => ClassCardModel(
        id: map["id"],
        programId: map["programId"],
        title: map["title"],
        href: map["href"],
        isReminderSet: map["isReminderSet"],
        coverPicture: map["coverPicture"] == null
            ? null
            : ImageModel.fromMap(map["coverPicture"]),
        featuredCoverUrl: map["featuredCoverUrl"] == null
            ? null
            : ImageModel.fromMap(map["featuredCoverUrl"]),
        coverPicture2By1: map["coverPicture2By1"] == null
            ? null
            : ImageModel.fromMap(map["coverPicture2By1"]),
        coverPicture3By2: map["coverPicture3By2"] == null
            ? null
            : ImageModel.fromMap(map["coverPicture3By2"]),
        classNum: map["classNum"],
        isClassNew: map["isClassNew"],
        isClassLive: map["isClassLive"],
        viewerCount: map["viewerCount"],
        attendanceCount: map["attendanceCount"],
        dateTime: map["dateTime"] == null
            ? null
            : DateTime.parse(map["dateTime"]).toLocal(),
        timestamp: map["timestamp"],
        programEnrollmentStartTime: map["programEnrollmentStartTime"] == null
            ? null
            : DateTime.parse(map["programEnrollmentStartTime"]).toLocal(),
        programStartDate: map["programStartDate"] == null
            ? null
            : DateTime.parse(map["programStartDate"]).toLocal(),
        duration: map["duration"],
        mentorName: map["mentorName"],
        mentorFullName: map["mentorFullName"],
        programTitle: map["programTitle"],
        programTypeTagText: map["programTypeTagText"],
        programTypeTagTextColor: map["programTypeTagTextColor"],
        programTypeTagBgColor: map["programTypeTagBgColor"],
        percentageWatched: map["percentageWatched"],
        attendanceInfo: map["attendanceInfo"],
        attendanceText: map["attendanceText"],
        attendanceBGColor: map["attendanceBGColor"],
        attendanceTextColor: map["attendanceTextColor"],
        watchMinutes: map["minutes"] == null
            ? null
            : List<int>.from(map["minutes"].map((x) => x)),
        shouldShowEnrollmentPopup: map["shouldShowEnrollmentPopup"],
        numClasses: map["numClasses"],
        topRightLabelText: map["topRightLabelText"],
        topRightLabelBgColor: map["topRightLabelBgColor"],
        topRightLabelTextColor: map["topRightLabelTextColor"],
        canEnrollInBatch: map["canEnrollInBatch"],
        color: map["color"],
        classTypeTagText: map["classTypeTagText"],
        classType: map["classType"],
        classTypeColor: map["classTypeColor"],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'programId': programId,
        'title': title,
        'href': href,
        'coverPicture': coverPicture,
        'coverPicture3By2': coverPicture3By2,
        'coverPicture2By1': coverPicture2By1,
        'classNum': classNum,
        'dateTime': dateTime,
        'duration': duration,
        'mentorName': mentorName,
        'timestamp': timestamp,
        'isClassLive': isClassLive,
        'viewerCount': viewerCount,
        'isClassNew': isClassNew,
        'programTitle': programTitle,
        'programEnrollmentStartTime': programEnrollmentStartTime,
        'programTypeTagText': programTypeTagText,
        'programTypeTagBgColor': programTypeTagBgColor,
        'programTypeTagTextColor': programTypeTagTextColor,
        'programStartDate': programStartDate,
        'featuredCoverUrl': featuredCoverUrl,
        'attendanceInfo': attendanceInfo,
        'attendanceText': attendanceText,
        'attendanceBGColor': attendanceBGColor,
        'attendanceTextColor': attendanceTextColor,
        'watchMinutes': watchMinutes,
        'mentorFullName': mentorFullName,
        'shouldShowEnrollmentPopup': shouldShowEnrollmentPopup,
        'numClasses': numClasses,
        'topRightLabelText': topRightLabelText,
        'topRightLabelBgColor': topRightLabelBgColor,
        'topRightLabelTextColor': topRightLabelTextColor,
        'canEnrollInBatch': canEnrollInBatch,
        'classTypeTagText': classTypeTagText,
        'classType': classType,
        'classTypeColor': classTypeColor,
        'color': color,
      };
}
