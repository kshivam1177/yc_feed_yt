// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

import 'package:yc_app/shared/models/image.model.dart';

DashboardResponse dashboardResponseFromJson(String str) =>
    DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) =>
    json.encode(data.toJson());

class DashboardResponse {
  DashboardResponse({
    this.v1GetDashboardPageData,
  });

  V1GetDashboardPageData? v1GetDashboardPageData;

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
        v1GetDashboardPageData: json["v1getDashboardPageData"] == null
            ? null
            : V1GetDashboardPageData.fromJson(json["v1getDashboardPageData"]),
      );

  Map<String, dynamic> toJson() => {
        "v1getDashboardPageData": v1GetDashboardPageData == null
            ? null
            : v1GetDashboardPageData!.toJson(),
      };
}

class V1GetDashboardPageData {
  V1GetDashboardPageData({
    this.greetingText,
    this.profilePic,
    this.profileName,
    this.sections,
  });

  String? greetingText;
  ImageModel? profilePic;
  String? profileName;
  List<DashboardSection>? sections;

  factory V1GetDashboardPageData.fromJson(Map<String, dynamic> json) =>
      V1GetDashboardPageData(
        greetingText:
            json["greetingText"] == null ? null : json["greetingText"],
        profilePic: json["profilePic"] == null
            ? null
            : ImageModel.fromMap(json["profilePic"]),
        profileName: json["profileName"] == null ? null : json["profileName"],
        sections: json["sections"] == null
            ? null
            : List<DashboardSection>.from(
                json["sections"].map((x) => DashboardSection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "greetingText": greetingText == null ? null : greetingText,
        "profilePic": profilePic,
        "profileName": profileName == null ? null : profileName,
        "sections": sections == null
            ? null
            : List<dynamic>.from(sections!.map((x) => x.toJson())),
      };
}

class DashboardSection {
  DashboardSection({
    this.sectionTitle,
    this.sectionType,
    this.sectionKey,
    this.sectionTitleColor,
    this.sectionScrollDirection,
    this.cardDisplayStyle,
    this.sectionDelimiter,
    this.cardDisplaySubStyle,
    this.sectionBackground,
    this.sectionExpansion,
    this.sectionClickAction,
    this.cards,
    this.sectionImageUrl,
    this.sectionIconUrl,
    this.sectionDescription,
    this.sectionStaticButton,
  });

  String? sectionTitle;
  String? sectionType;
  String? sectionKey;
  String? sectionTitleColor;
  String? cardDisplayStyle;
  String? sectionScrollDirection;
  SectionDelimiter? sectionDelimiter;
  String? cardDisplaySubStyle;
  SectionBackground? sectionBackground;
  SectionExpansionTextCta? sectionClickAction;
  SectionExpansion? sectionExpansion;
  List<List<ClassCard>>? cards;
  String? sectionImageUrl;
  String? sectionIconUrl;
  String? sectionDescription;
  SectionStaticButton? sectionStaticButton;

  factory DashboardSection.fromJson(Map<String, dynamic> json) =>
      DashboardSection(
        sectionTitle:
            json["sectionTitle"] == null ? null : json["sectionTitle"],
        sectionType: json["sectionType"] == null ? null : json["sectionType"],
        sectionKey: json["sectionKey"] == null ? null : json["sectionKey"],
        sectionTitleColor: json["sectionTitleColor"] == null
            ? null
            : json["sectionTitleColor"],
        sectionScrollDirection: json["sectionScrollDirection"] == null
            ? null
            : json["sectionScrollDirection"],
        cardDisplayStyle:
            json["cardDisplayStyle"] == null ? null : json["cardDisplayStyle"],
        sectionDelimiter: json["sectionDelimiter"] == null
            ? null
            : SectionDelimiter.fromJson(json["sectionDelimiter"]),
        cardDisplaySubStyle: json["cardDisplaySubStyle"] == null
            ? null
            : json["cardDisplaySubStyle"],
        sectionBackground: json["sectionBackground"] == null
            ? null
            : SectionBackground.fromJson(json["sectionBackground"]),
        sectionClickAction: json["sectionClickAction"] == null
            ? null
            : SectionExpansionTextCta.fromJson(json["sectionClickAction"]),
        sectionExpansion: json["sectionExpansion"] == null
            ? null
            : SectionExpansion.fromJson(json["sectionExpansion"]),
        cards: json["cards"] == null
            ? null
            : List<List<ClassCard>>.from(json["cards"].map((x) =>
                List<ClassCard>.from(x.map((x) => ClassCard.fromJson(x))))),
        sectionImageUrl:
            json["sectionImageUrl"] == null ? null : json["sectionImageUrl"],
        sectionIconUrl:
            json["sectionIconUrl"] == null ? null : json["sectionIconUrl"],
        sectionDescription: json["sectionDescription"] == null
            ? null
            : json["sectionDescription"],
        sectionStaticButton: json["sectionStaticButton"] == null
            ? null
            : SectionStaticButton.fromJson(json["sectionStaticButton"]),
      );

  Map<String, dynamic> toJson() => {
        "sectionTitle": sectionTitle == null ? null : sectionTitle,
        "sectionType": sectionType == null ? null : sectionType,
        "sectionTitleColor":
            sectionTitleColor == null ? null : sectionTitleColor,
        "sectionScrollDirection":
            sectionScrollDirection == null ? null : sectionScrollDirection,
        "cardDisplayStyle": cardDisplayStyle == null ? null : cardDisplayStyle,
        "sectionDelimiter":
            sectionDelimiter == null ? null : sectionDelimiter!.toJson(),
        "cardDisplaySubStyle":
            cardDisplaySubStyle == null ? null : cardDisplaySubStyle,
        "sectionBackground":
            sectionBackground == null ? null : sectionBackground!.toJson(),
        "sectionExpansion":
            sectionExpansion == null ? null : sectionExpansion!.toJson(),
        "cards": cards == null
            ? null
            : List<dynamic>.from(cards!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "sectionImageUrl": sectionImageUrl == null ? null : sectionImageUrl,
        "sectionStaticButton":
            sectionStaticButton == null ? null : sectionStaticButton!.toJson(),
      };
}

class ClassCard {
  ClassCard({
    this.rank,
    this.score,
    this.entityType,
    this.entityId,
    this.classNum,
    this.cardBackground,
    this.cardClickAction,
    this.entityTitle,
    this.mentorName,
    this.mentorGender,
    this.ageRange,
    this.completionPercentage,
    this.progressBar,
    this.isClassLive,
    this.isFeatured,
    this.programId,
    this.dateTime,
    this.duration,
    this.viewerCount,
    this.classType,
    this.classTypeColor,
    this.programType,
    this.programContinuityType,
    this.programStartDate,
    this.isUpcoming,
    this.isUpcomingColor,
    this.programTitle,
    this.programEnrollmentStartTime,
    this.programEnrollmentEndTime,
    this.numClasses,
    this.attendanceCount,
    this.numAttendedClasses,
  });
  int? rank;
  double? score;
  String? entityType;
  String? entityId;
  String? classNum;
  CardBackground? cardBackground;
  SectionExpansionTextCta? cardClickAction;
  String? entityTitle;
  String? mentorName;
  String? mentorGender;
  AgeRange? ageRange;
  double? completionPercentage;
  List<int>? progressBar;
  bool? isClassLive;
  bool? isFeatured;
  String? programId;
  DateTime? dateTime;
  int? duration;
  num? viewerCount;
  num? attendanceCount;
  String? classType;
  String? classTypeColor;
  String? programType;
  String? programTitle;
  String? programContinuityType;
  DateTime? programStartDate;
  bool? isUpcoming;
  String? isUpcomingColor;
  DateTime? programEnrollmentStartTime;
  DateTime? programEnrollmentEndTime;
  num? numClasses;
  num? numAttendedClasses;

  factory ClassCard.fromJson(Map<String, dynamic> json) => ClassCard(
        entityType: json["entityType"] == null ? null : json["entityType"],
        score: json["score"] == null ? null : json["score"],
        rank: json["rank"] == null ? null : json["rank"],
        entityId: json["entityId"] == null ? null : json["entityId"],
        classNum: json["classNum"] == null ? null : json["classNum"],
        cardBackground: json["cardBackground"] == null
            ? null
            : CardBackground.fromJson(json["cardBackground"]),
        cardClickAction: json["cardClickAction"] == null
            ? null
            : SectionExpansionTextCta.fromJson(json["cardClickAction"]),
        entityTitle: json["entityTitle"] == null ? null : json["entityTitle"],
        mentorName: json["mentorName"] == null ? null : json["mentorName"],
        mentorGender:
            json["mentorGender"] == null ? null : json["mentorGender"],
        ageRange: json["ageRange"] == null
            ? null
            : AgeRange.fromJson(json["ageRange"]),
        completionPercentage: json["completionPercentage"] == null
            ? null
            : json["completionPercentage"].toDouble(),
        progressBar: json["progressBar"] == null
            ? null
            : List<int>.from(json["progressBar"].map((x) => x)),
        isClassLive: json["isClassLive"] == null ? null : json["isClassLive"],
        isFeatured: json["isFeatured"] == null ? null : json["isFeatured"],
        programId: json["programId"] == null ? null : json["programId"],
        dateTime:
            json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        duration: json["duration"] == null ? null : json["duration"],
        viewerCount: json["viewerCount"] == null ? null : json["viewerCount"],
        attendanceCount:
            json["attendanceCount"] == null ? null : json["attendanceCount"],
        classType: json["classType"] == null ? null : json["classType"],
        classTypeColor:
            json["classTypeColor"] == null ? null : json["classTypeColor"],
        programType: json["programType"] == null ? null : json["programType"],
        programTitle:
            json["programTitle"] == null ? null : json["programTitle"],
        programContinuityType: json["programContinuityType"] == null
            ? null
            : json["programContinuityType"],
        programStartDate: json["programStartDate"] == null
            ? null
            : DateTime.parse(json["programStartDate"]),
        isUpcoming: json["isUpcoming"] == null ? null : json["isUpcoming"],
        isUpcomingColor:
            json["isUpcomingColor"] == null ? null : json["isUpcomingColor"],
        programEnrollmentStartTime: json["programEnrollmentStartTime"] == null
            ? null
            : DateTime.parse(json["programEnrollmentStartTime"]),
        programEnrollmentEndTime: json["programEnrollmentEndTime"] == null
            ? null
            : DateTime.parse(json["programEnrollmentEndTime"]),
        numClasses: json["numClasses"] == null ? null : json["numClasses"],
        numAttendedClasses: json["numAttendedClasses"] == null
            ? null
            : json["numAttendedClasses"],
      );

  Map<String, dynamic> toJson() => {
        "score": score == null ? null : score,
        "rank": rank == null ? null : rank,
        "entityType": entityType == null ? null : entityType,
        "entityId": entityId == null ? null : entityId,
        "classNum": classNum == null ? null : classNum,
        "cardBackground":
            cardBackground == null ? null : cardBackground!.toJson(),
        "cardClickAction":
            cardClickAction == null ? null : cardClickAction!.toJson(),
        "entityTitle": entityTitle == null ? null : entityTitle,
        "mentorName": mentorName == null ? null : mentorName,
        "mentorGender": mentorGender == null ? null : mentorGender,
        "ageRange": ageRange == null ? null : ageRange!.toJson(),
        "completionPercentage":
            completionPercentage == null ? null : completionPercentage,
        "progressBar": progressBar == null
            ? null
            : List<dynamic>.from(progressBar!.map((x) => x)),
        "isClassLive": isClassLive == null ? null : isClassLive,
        "isFeatured": isFeatured == null ? null : isFeatured,
        "programId": programId == null ? null : programId,
        "dateTime": dateTime == null ? null : dateTime!.toIso8601String(),
        "duration": duration == null ? null : duration,
        "viewerCount": viewerCount == null ? null : viewerCount,
        "classType": classType == null ? null : classType,
        "classTypeColor": classTypeColor == null ? null : classTypeColor,
        "programType": programType == null ? null : programType,
        "programContinuityType":
            programContinuityType == null ? null : programContinuityType,
        "programStartDate": programStartDate == null
            ? null
            : programStartDate!.toIso8601String(),
        "isUpcoming": isUpcoming == null ? null : isUpcoming,
        "isUpcomingColor": isUpcomingColor == null ? null : isUpcomingColor,
        "programEnrollmentStartTime": programEnrollmentStartTime == null
            ? null
            : programEnrollmentStartTime!.toIso8601String(),
        "programEnrollmentEndTime": programEnrollmentEndTime == null
            ? null
            : programEnrollmentEndTime!.toIso8601String(),
        "numClasses": numClasses == null ? null : numClasses,
        "numAttendedClasses":
            numAttendedClasses == null ? null : numAttendedClasses,
      };
}

class AgeRange {
  AgeRange({
    this.min,
    this.max,
  });

  int? min;
  int? max;

  factory AgeRange.fromJson(Map<String, dynamic> json) => AgeRange(
        min: json["min"] == null ? null : json["min"],
        max: json["max"] == null ? null : json["max"],
      );

  Map<String, dynamic> toJson() => {
        "min": min == null ? null : min,
        "max": max == null ? null : max,
      };
}

class CardBackground {
  CardBackground({
    this.backgroundType,
    this.backgroundColor,
    this.backgroundImageUrl,
    this.aspectRatio,
  });

  String? backgroundType;
  String? backgroundColor;
  String? backgroundImageUrl;
  String? aspectRatio;

  factory CardBackground.fromJson(Map<String, dynamic> json) => CardBackground(
        backgroundType:
            json["backgroundType"] == null ? null : json["backgroundType"],
        backgroundColor: json["backgroundColor"],
        backgroundImageUrl: json["backgroundImageUrl"] == null
            ? null
            : json["backgroundImageUrl"],
        aspectRatio: json["aspectRatio"] == null ? null : json["aspectRatio"],
      );

  Map<String, dynamic> toJson() => {
        "backgroundType": backgroundType == null ? null : backgroundType,
        "backgroundColor": backgroundColor,
        "backgroundImageUrl":
            backgroundImageUrl == null ? null : backgroundImageUrl,
        "aspectRatio": aspectRatio == null ? null : aspectRatio,
      };
}

class SectionExpansionTextCta {
  SectionExpansionTextCta({
    this.clickActionUrl,
    this.clickActionType,
  });

  String? clickActionUrl;
  String? clickActionType;

  factory SectionExpansionTextCta.fromJson(Map<String, dynamic> json) =>
      SectionExpansionTextCta(
        clickActionUrl:
            json["clickActionUrl"] == null ? null : json["clickActionUrl"],
        clickActionType:
            json["clickActionType"] == null ? null : json["clickActionType"],
      );

  Map<String, dynamic> toJson() => {
        "clickActionUrl": clickActionUrl == null ? null : clickActionUrl,
        "clickActionType": clickActionType == null ? null : clickActionType,
      };
}

class SectionBackground {
  SectionBackground({
    this.backgroundType,
    this.backgroundColor,
    this.gradientColor1,
    this.gradientColor2,
    this.gradientDirection,
    this.shouldLeaveBorder = false,
  });

  String? backgroundType;
  String? backgroundColor;
  String? gradientColor1;
  String? gradientColor2;
  String? gradientDirection;
  bool shouldLeaveBorder;

  factory SectionBackground.fromJson(Map<String, dynamic> json) =>
      SectionBackground(
        backgroundType:
            json["backgroundType"] == null ? null : json["backgroundType"],
        backgroundColor:
            json["backgroundColor"] == null ? null : json["backgroundColor"],
        gradientColor1:
            json["gradientColor1"] == null ? null : json["gradientColor1"],
        gradientColor2:
            json["gradientColor2"] == null ? null : json["gradientColor2"],
        gradientDirection: json["gradientDirection"] == null
            ? null
            : json["gradientDirection"],
        shouldLeaveBorder: json["shouldLeaveBorder"] == null
            ? false
            : json["shouldLeaveBorder"],
      );

  Map<String, dynamic> toJson() => {
        "backgroundType": backgroundType == null ? null : backgroundType,
        "backgroundColor": backgroundColor == null ? null : backgroundColor,
      };
}

class SectionDelimiter {
  SectionDelimiter({
    this.delimiterColor,
    this.allowDelimiter,
  });

  String? delimiterColor;
  bool? allowDelimiter;

  factory SectionDelimiter.fromJson(Map<String, dynamic> json) =>
      SectionDelimiter(
        delimiterColor:
            json["delimiterColor"] == null ? null : json["delimiterColor"],
        allowDelimiter:
            json["allowDelimiter"] == null ? null : json["allowDelimiter"],
      );

  Map<String, dynamic> toJson() => {
        "delimiterColor": delimiterColor == null ? null : delimiterColor,
        "allowDelimiter": allowDelimiter == null ? null : allowDelimiter,
      };
}

class SectionExpansion {
  SectionExpansion({
    this.sectionExpansionText,
    this.sectionExpansionTextCta,
    this.sectionExpansionTextColor,
  });

  String? sectionExpansionText;
  SectionExpansionTextCta? sectionExpansionTextCta;
  String? sectionExpansionTextColor;

  factory SectionExpansion.fromJson(Map<String, dynamic> json) =>
      SectionExpansion(
        sectionExpansionText: json["sectionExpansionText"] == null
            ? null
            : json["sectionExpansionText"],
        sectionExpansionTextCta: json["sectionExpansionTextCTA"] == null
            ? null
            : SectionExpansionTextCta.fromJson(json["sectionExpansionTextCTA"]),
        sectionExpansionTextColor: json["sectionExpansionTextColor"] == null
            ? null
            : json["sectionExpansionTextColor"],
      );

  Map<String, dynamic> toJson() => {
        "sectionExpansionText":
            sectionExpansionText == null ? null : sectionExpansionText,
        "sectionExpansionTextCTA": sectionExpansionTextCta == null
            ? null
            : sectionExpansionTextCta!.toJson(),
        "sectionExpansionTextColor": sectionExpansionTextColor == null
            ? null
            : sectionExpansionTextColor,
      };
}

class SectionStaticButton {
  SectionStaticButton({
    this.buttonText,
    this.buttonColor,
    this.buttonTextColor,
    this.buttonCta,
  });

  String? buttonText;
  String? buttonColor;
  String? buttonTextColor;
  SectionExpansionTextCta? buttonCta;

  factory SectionStaticButton.fromJson(Map<String, dynamic> json) =>
      SectionStaticButton(
        buttonText: json["buttonText"] == null ? null : json["buttonText"],
        buttonColor: json["buttonColor"] == null ? null : json["buttonColor"],
        buttonTextColor:
            json["buttonTextColor"] == null ? null : json["buttonTextColor"],
        buttonCta: json["buttonCTA"] == null
            ? null
            : SectionExpansionTextCta.fromJson(json["buttonCTA"]),
      );

  Map<String, dynamic> toJson() => {
        "buttonText": buttonText == null ? null : buttonText,
        "buttonColor": buttonColor == null ? null : buttonColor,
        "buttonCTA": buttonCta == null ? null : buttonCta!.toJson(),
      };
}
