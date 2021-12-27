import 'dart:convert';
import 'package:yc_app/shared/models/homepage/dashboard_response.model.dart';
import 'homepage/pre_login_homepage.model.dart';

RecommendedClassesListingPageDataModel
    recommendedClassesListingPageDataModelFromJson(String str) =>
        RecommendedClassesListingPageDataModel.fromJson(json.decode(str));

String recommendedClassesListingPageDataModelToJson(
        RecommendedClassesListingPageDataModel data) =>
    json.encode(data.toJson());

class RecommendedClassesListingPageDataModel {
  RecommendedClassesListingPageDataModel({
    this.v1GetMyPageData,
  });

  V1GetMyPageData? v1GetMyPageData;

  factory RecommendedClassesListingPageDataModel.fromJson(
          Map<String, dynamic> json) =>
      RecommendedClassesListingPageDataModel(
        v1GetMyPageData: json["v1GetMYPageData"] == null
            ? null
            : V1GetMyPageData.fromJson(json["v1GetMYPageData"]),
      );

  Map<String, dynamic> toJson() => {
        "v1GetMYPageData":
            v1GetMyPageData == null ? null : v1GetMyPageData?.toJson(),
      };
}

class V1GetMyPageData {
  V1GetMyPageData({
    this.sections,
    this.recommendedClassesListingId,
  });

  List<ContentDashSection>? sections;
  String? recommendedClassesListingId;

  factory V1GetMyPageData.fromJson(Map<String, dynamic> json) =>
      V1GetMyPageData(
        sections: json["sections"] == null
            ? null
            : List<ContentDashSection>.from(
                json["sections"].map((x) => ContentDashSection.fromJson(x))),
        recommendedClassesListingId: json["recommendedClassesListingId"] == null
            ? null
            : json["recommendedClassesListingId"],
      );

  Map<String, dynamic> toJson() => {
        "sections": sections == null
            ? null
            : List<dynamic>.from(sections!.map((x) => x.toJson())),
        "recommendedClassesListingId": recommendedClassesListingId == null
            ? null
            : recommendedClassesListingId,
      };
}

class ContentDashSection {
  ContentDashSection({
    this.sectionType,
    this.hookDetails,
    this.trustMarkersSection,
    this.reviewSection,
    this.skillsSection,
    this.banners,
    this.heroSection,
    this.upcomingClasses,
    this.competitionClasses,
    this.classes,
  });

  String? sectionType;
  HookDetails? hookDetails;
  List<TrustMarkersSection>? trustMarkersSection;
  ReviewSection? reviewSection;
  List<SkillsSection>? skillsSection;
  HeroSection? heroSection;
  List<ClassCard>? upcomingClasses;
  List<ClassCard>? banners;
  List<ClassCard>? competitionClasses;
  List<ClassCard>? classes;

  factory ContentDashSection.fromJson(Map<String, dynamic> json) =>
      ContentDashSection(
        sectionType: json["sectionType"] == null ? null : json["sectionType"],
        hookDetails: json["hookDetails"] == null
            ? null
            : HookDetails.fromJson(json["hookDetails"]),
        trustMarkersSection: json["trustMarkersSection"] == null
            ? null
            : List<TrustMarkersSection>.from(json["trustMarkersSection"]
                .map((x) => TrustMarkersSection.fromJson(x))),
        reviewSection: json["reviewSection"] == null
            ? null
            : ReviewSection.fromJson(json["reviewSection"]),
        skillsSection: json["skillsSection"] == null
            ? null
            : List<SkillsSection>.from(
                json["skillsSection"].map((x) => SkillsSection.fromJson(x))),
        heroSection: json["heroSection"] == null
            ? null
            : HeroSection.fromJson(json["heroSection"]),
        upcomingClasses: json["upcomingClasses"] == null
            ? null
            : List<ClassCard>.from(
                json["upcomingClasses"].map((x) => ClassCard.fromJson(x))),
        banners: json["banners"] == null
            ? null
            : List<ClassCard>.from(
                json["banners"].map((x) => ClassCard.fromJson(x))),
        competitionClasses: json["competitionClasses"] == null
            ? null
            : List<ClassCard>.from(
                json["competitionClasses"].map((x) => ClassCard.fromJson(x))),
        classes: json["classes"] == null
            ? null
            : List<ClassCard>.from(
                json["classes"].map((x) => ClassCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sectionType": sectionType == null ? null : sectionType,
        "hookDetails": hookDetails == null ? null : hookDetails?.toJson(),
        "trustMarkersSection": trustMarkersSection == null
            ? null
            : List<dynamic>.from(trustMarkersSection!.map((x) => x.toJson())),
        "reviewSection": reviewSection == null ? null : reviewSection?.toJson(),
        "skillsSection": skillsSection == null
            ? null
            : List<dynamic>.from(skillsSection!.map((x) => x.toJson())),
        "heroSection": heroSection == null ? null : heroSection?.toJson(),
        //"upcomingClasses": upcomingClasses,
        //"competitionClasses": competitionClasses,
        //"classes": classes == null ? null : List<dynamic>.from(classes.map((x) => x.toJson())),
      };
}

class HeroSection {
  HeroSection({
    this.headingText,
    this.headingTextColor,
    this.subHeadingText,
    this.subHeadingTextColor,
  });

  String? headingText;
  String? headingTextColor;
  String? subHeadingText;
  String? subHeadingTextColor;

  factory HeroSection.fromJson(Map<String, dynamic> json) => HeroSection(
        headingText: json["headingText"] == null ? null : json["headingText"],
        headingTextColor:
            json["headingTextColor"] == null ? null : json["headingTextColor"],
        subHeadingText:
            json["subHeadingText"] == null ? null : json["subHeadingText"],
        subHeadingTextColor: json["subHeadingTextColor"] == null
            ? null
            : json["subHeadingTextColor"],
      );

  Map<String, dynamic> toJson() => {
        "headingText": headingText == null ? null : headingText,
        "headingTextColor": headingTextColor == null ? null : headingTextColor,
        "subHeadingText": subHeadingText == null ? null : subHeadingText,
        "subHeadingTextColor":
            subHeadingTextColor == null ? null : subHeadingTextColor,
      };
}

class HookDetails {
  HookDetails({
    this.clickActionType,
    this.clickActionUrl,
    this.buttonText,
    this.buttonTextColor,
    this.backgroundImgUrl,
    this.description,
    this.descriptionTextColor,
    this.backgroundColor,
    this.hookType,
  });

  String? clickActionType;
  String? clickActionUrl;
  String? buttonText;
  String? buttonTextColor;
  String? backgroundImgUrl;
  String? description;
  String? descriptionTextColor;
  String? hookType;
  String? backgroundColor;

  factory HookDetails.fromJson(Map<String, dynamic> json) => HookDetails(
        clickActionType:
            json["clickActionType"] == null ? null : json["clickActionType"],
        clickActionUrl:
            json["clickActionUrl"] == null ? null : json["clickActionUrl"],
        buttonText: json["buttonText"] == null ? null : json["buttonText"],
        buttonTextColor:
            json["buttonTextColor"] == null ? null : json["buttonTextColor"],
        backgroundImgUrl:
            json["backgroundImgUrl"] == null ? null : json["backgroundImgUrl"],
        description: json["description"] == null ? null : json["description"],
        descriptionTextColor:
            json["descriptionColor"] == null ? null : json["descriptionColor"],
        backgroundColor:
            json["backgroundColor"] == null ? null : json["backgroundColor"],
        hookType: json["hookType"] == null ? null : json["hookType"],
      );

  Map<String, dynamic> toJson() => {
        "clickActionType": clickActionType == null ? null : clickActionType,
        "clickActionUrl": clickActionUrl == null ? null : clickActionUrl,
        "buttonText": buttonText == null ? null : buttonText,
        "buttonTextColor": buttonTextColor == null ? null : buttonTextColor,
        "backgroundImgUrl": backgroundImgUrl == null ? null : backgroundImgUrl,
        "description": description == null ? null : description,
      };
}

class ReviewSection {
  ReviewSection({
    this.rating,
    this.reviewsCount,
    this.enrollmentCount,
    this.reviews,
  });

  String? rating;
  String? reviewsCount;
  String? enrollmentCount;
  List<Review>? reviews;

  factory ReviewSection.fromJson(Map<String, dynamic> json) => ReviewSection(
        rating: json["rating"] == null ? null : json["rating"],
        reviewsCount:
            json["reviewsCount"] == null ? null : json["reviewsCount"],
        enrollmentCount:
            json["enrollmentCount"] == null ? null : json["enrollmentCount"],
        reviews: json["reviews"] == null
            ? null
            : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating == null ? null : rating,
        "reviewsCount": reviewsCount == null ? null : reviewsCount,
        "enrollmentCount": enrollmentCount == null ? null : enrollmentCount,
        "reviews": reviews == null
            ? null
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
      };
}

class Review {
  Review({
    this.reviewerName,
    this.profilePic,
    this.review,
  });

  String? reviewerName;
  String? profilePic;
  String? review;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        reviewerName:
            json["reviewerName"] == null ? null : json["reviewerName"],
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
        review: json["review"] == null ? null : json["review"],
      );

  Map<String, dynamic> toJson() => {
        "reviewerName": reviewerName == null ? null : reviewerName,
        "profilePic": profilePic == null ? null : profilePic,
        "review": review == null ? null : review,
      };
}

class SkillsSection {
  SkillsSection({
    this.id,
    this.title,
    this.displayTitle,
    this.programs,
    this.image,
    this.color,
  });

  String? id;
  String? title;
  String? displayTitle;
  List<ClassCardModel>? programs;
  Image? image;
  String? color;

  factory SkillsSection.fromJson(Map<String, dynamic> json) => SkillsSection(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        displayTitle:
            json["displayTitle"] == null ? null : json["displayTitle"],
        programs: json["programs"] == null
            ? null
            : List<ClassCardModel>.from(
                json["programs"].map((x) => ClassCardModel.fromMap(x))),
        image: json["image"] == null ? null : Image.fromMap(json["image"]),
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "displayTitle": displayTitle == null ? null : displayTitle,
        "programs": programs == null
            ? null
            : List<dynamic>.from(programs!.map((x) => x)),
        "image": image == null ? null : image?.toMap(),
        "color": color == null ? null : color,
      };
}

class TrustMarkersSection {
  TrustMarkersSection({
    this.key,
    this.label,
    this.iconUrl,
    this.bgColor,
  });

  String? key;
  String? label;
  String? iconUrl;
  String? bgColor;

  factory TrustMarkersSection.fromJson(Map<String, dynamic> json) =>
      TrustMarkersSection(
        key: json["key"] == null ? null : json["key"],
        label: json["label"] == null ? null : json["label"],
        iconUrl: json["iconURL"] == null ? null : json["iconURL"],
        bgColor: json["bgColor"] == null ? null : json["bgColor"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "label": label == null ? null : label,
        "iconURL": iconUrl == null ? null : iconUrl,
        "bgColor": bgColor == null ? null : bgColor,
      };
}

class Image {
  Image({
    this.id,
    this.url,
    this.entityType,
    this.entityId,
  });

  String? id;
  String? url;
  String? entityType;
  String? entityId;

  factory Image.fromMap(Map<String, dynamic> map) => Image(
        id: map["id"],
        url: map["url"] == null ? null : map["url"],
        entityType: map["entityType"],
        entityId: map["entityId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "url": url == null ? null : url,
        "entityType": entityType,
        "entityId": entityId,
      };
}

class HomePageSection2 {
  HomePageSection2({
    this.headerKey,
    this.headerTitle,
    this.cards,
    this.entityType,
    this.bgColor,
    this.txtColor,
    this.description,
    this.title,
    this.ctaType,
    this.deepLink,
    this.iconUrl,
    this.ctaUrl,
  });

  String? headerKey;
  String? headerTitle;
  List<ClassCardModel>? cards;
  HomePageEntityEnum? entityType;
  String? bgColor;
  String? txtColor;
  String? description;
  String? title;
  String? ctaType;
  String? deepLink;
  String? iconUrl;
  String? ctaUrl;
  bool showBGColor = false;

  factory HomePageSection2.fromMap(Map<String, dynamic> map) =>
      HomePageSection2(
        headerKey: map["headerKey"] == null ? null : map["headerKey"],
        headerTitle: map["headerTitle"] == null ? null : map["headerTitle"],
        cards: map["cards"] == null
            ? null
            : List<ClassCardModel>.from(map["cards"]
            .map((x) => x == null ? null : ClassCardModel.fromMap(x))),
        entityType: map["entityType"] == null
            ? null
            : HomePageEntityEnum.values.firstWhere(
                (e) => e.toString().split('.').last == map["entityType"]),
        bgColor: map["bgColor"] == null ? null : map["bgColor"],
        txtColor: map["txtColor"] == null ? null : map["txtColor"],
        description: map["description"] == null ? null : map["description"],
        title: map["title"] == null ? null : map["title"],
        ctaType: map["ctaType"] == null ? null : map["ctaType"],
        deepLink: map["deepLink"] == null ? null : map["deepLink"],
        iconUrl: map["iconURL"] == null ? null : map["iconURL"],
        ctaUrl: map["ctaUrl"] == null ? null : map["ctaUrl"],
      );
}
enum HomePageEntityEnum {
  CLASS,
  CLASS1,
  CLASS2,
  PROGRAM,
  HOOK1,
  HOOK2,
  FEATURED,
}

RecommendedClassesClickInputModel recommendedClassesClickInputModelFromJson(
    String str) =>
    RecommendedClassesClickInputModel.fromJson(json.decode(str));

String recommendedClassesClickInputModelToJson(
    RecommendedClassesClickInputModel data) =>
    json.encode(data.toJson());

class RecommendedClassesClickInputModel {
  RecommendedClassesClickInputModel({
    this.clickInput,
  });

  ClickInput? clickInput;

  factory RecommendedClassesClickInputModel.fromJson(
      Map<String, dynamic> json) =>
      RecommendedClassesClickInputModel(
        clickInput: json["clickInput"] == null
            ? null
            : ClickInput.fromJson(json["clickInput"]),
      );

  Map<String, dynamic> toJson() => {
    "clickInput": clickInput == null ? null : clickInput?.toJson(),
  };
}

class ClickInput {
  ClickInput({
    this.recommendedClassesListingId,
    this.rank,
    this.classDetails,
  });

  String? recommendedClassesListingId;
  int? rank;
  ClassDetailsInput? classDetails;

  factory ClickInput.fromJson(Map<String, dynamic> json) => ClickInput(
    recommendedClassesListingId: json["recommendedClassesListingId"] == null
        ? null
        : json["recommendedClassesListingId"],
    rank: json["rank"] == null ? null : json["rank"],
    classDetails: json["classDetails"] == null
        ? null
        : ClassDetailsInput.fromJson(json["classDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "recommendedClassesListingId": recommendedClassesListingId == null
        ? null
        : recommendedClassesListingId,
    "rank": rank == null ? null : rank,
    "classDetails": classDetails == null ? null : classDetails?.toJson(),
  };
}


class ClassDetailsInput {
  ClassDetailsInput({
    this.entityId,
    this.entityType,
    this.score,
    this.programType,
    this.programContinuity,
    this.batchToClasses,
    this.classNum,
  });

  String? entityId;
  String? entityType;
  double? score;
  String? programType;
  String? programContinuity;
  List<BatchToClass>? batchToClasses;
  String? classNum;

  factory ClassDetailsInput.fromJson(Map<String, dynamic> json) =>
      ClassDetailsInput(
        entityId: json["entityId"] == null ? null : json["entityId"],
        entityType: json["entityType"] == null ? null : json["entityType"],
        score: json["score"] == null ? null : json["score"].toDouble(),
        programType: json["programType"] == null ? null : json["programType"],
        programContinuity: json["programContinuity"] == null
            ? null
            : json["programContinuity"],
        batchToClasses: json["batchToClasses"] == null
            ? null
            : List<BatchToClass>.from(
            json["batchToClasses"].map((x) => BatchToClass.fromJson(x))),
        classNum: json["classNum"] == null ? null : json["classNum"],
      );

  Map<String, dynamic> toJson() => {
    "entityId": entityId == null ? null : entityId,
    "entityType": entityType == null ? null : entityType,
    "score": score == null ? null : score,
    "programType": programType == null ? null : programType,
    "programContinuity":
    programContinuity == null ? null : programContinuity,
    "batchToClasses": batchToClasses == null
        ? null
        : List<dynamic>.from(batchToClasses!.map((x) => x.toJson())),
    "classNum": classNum == null ? null : classNum,
  };
}

class BatchToClass {
  BatchToClass({
    this.id,
    this.dateTime,
    this.batchId,
    this.classNum,
    this.duration,
    this.enrollmentStartTime,
    this.enrollmentEndTime,
  });

  String? id;
  DateTime? dateTime;
  String? batchId;
  String? classNum;
  int? duration;
  DateTime? enrollmentStartTime;
  DateTime? enrollmentEndTime;

  factory BatchToClass.fromJson(Map<String, dynamic> json) => BatchToClass(
    id: json["id"] == null ? null : json["id"],
    dateTime:
    json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    batchId: json["batchId"] == null ? null : json["batchId"],
    classNum: json["classNum"] == null ? null : json["classNum"],
    duration: json["duration"] == null ? null : json["duration"],
    enrollmentStartTime: json["enrollmentStartTime"] == null
        ? null
        : DateTime.parse(json["enrollmentStartTime"]),
    enrollmentEndTime: json["enrollmentEndTime"] == null
        ? null
        : DateTime.parse(json["enrollmentEndTime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "dateTime": dateTime == null ? null : dateTime?.toIso8601String(),
    "batchId": batchId == null ? null : batchId,
    "classNum": classNum == null ? null : classNum,
    "duration": duration == null ? null : duration,
    "enrollmentStartTime": enrollmentStartTime == null
        ? null
        : enrollmentStartTime?.toIso8601String(),
    "enrollmentEndTime": enrollmentEndTime == null
        ? null
        : enrollmentEndTime?.toIso8601String(),
  };
}

class HomePageDataV2 {
  HomePageDataV2({
    this.v2GetHomePageData,
    this.getNotificationsBellStatus,
  });

  V2GetHomePageDataClass? v2GetHomePageData;
  GetNotificationsBellStatus? getNotificationsBellStatus;

  factory HomePageDataV2.fromMap(Map<String, dynamic> map) {
    if (map.containsKey("getNotificationsBellStatus")) {
      return HomePageDataV2(
        v2GetHomePageData: map["v2getHomePageData"] == null
            ? null
            : V2GetHomePageDataClass.fromMap(map["v2getHomePageData"]),
        getNotificationsBellStatus: map["getNotificationsBellStatus"] == null
            ? null
            : GetNotificationsBellStatus.fromMap(
            map["getNotificationsBellStatus"]),
      );
    } else {
      return HomePageDataV2(
        v2GetHomePageData: map["v2getHomePageData"] == null
            ? null
            : V2GetHomePageDataClass.fromMap(map["v2getHomePageData"]),
      );
    }
  }
}
class GetNotificationsBellStatus {
  GetNotificationsBellStatus({
    this.status,
  });

  bool? status;

  factory GetNotificationsBellStatus.fromMap(Map<String, dynamic> map) =>
      GetNotificationsBellStatus(
        status: map["status"],
      );
}

class V2GetHomePageDataClass {
  V2GetHomePageDataClass({
    this.rows,
  });

  List<HomePageSection2>? rows;

  factory V2GetHomePageDataClass.fromMap(Map<String, dynamic> map) =>
      V2GetHomePageDataClass(
        rows: map["rows"] == null
            ? null
            : List<HomePageSection2>.from(
          map["rows"].map((x) => HomePageSection2.fromMap(x)),
        ),
      );
}