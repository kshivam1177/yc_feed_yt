// To parse this JSON data, do
//
//     final getClassList = getClassListFromJson(jsonString);

import 'dart:convert';

import 'package:yc_app/shared/models/image.model.dart';

GetClassList getClassListFromJson(String str) =>
    GetClassList.fromJson(json.decode(str));

String getClassListToJson(GetClassList data) => json.encode(data.toJson());

class GetClassList {
  GetClassList({
    this.getClassList,
  });

  GetClassListClass? getClassList;

  factory GetClassList.fromJson(Map<String, dynamic> json) => GetClassList(
    getClassList: json["getClassList"] == null
        ? null
        : GetClassListClass.fromJson(json["getClassList"]),
  );

  Map<String, dynamic> toJson() => {
    "getClassList": getClassList == null ? null : getClassList!.toJson(),
  };
}

class GetClassListClass {
  GetClassListClass({
    this.count,
    this.classes,
    this.title,
    this.shouldShowProgress,
    this.shouldShowNumClasses,
    this.lastClassTime,
  });

  int? count;
  List<ClassListCardModel>? classes;
  String? title;
  bool? shouldShowProgress;
  bool? shouldShowNumClasses;
  String? lastClassTime;

  factory GetClassListClass.fromJson(Map<String, dynamic> json) =>
      GetClassListClass(
        count: json["count"] == null ? null : json["count"],
        classes: json["classes"] == null
            ? null
            : List<ClassListCardModel>.from(
            json["classes"].map((x) => ClassListCardModel.fromJson(x))),
        title: json["title"] == null ? null : json["title"],
        shouldShowProgress: json["shouldShowProgress"] == null
            ? null
            : json["shouldShowProgress"],
        shouldShowNumClasses: json["shouldShowNumClasses"] == null
            ? null
            : json["shouldShowNumClasses"],
        lastClassTime:
        json['lastClassTime'] == null ? null : json["lastClassTime"],
      );

  Map<String, dynamic> toJson() => {
    "count": count == null ? null : count,
    "classes": classes == null
        ? null
        : List<dynamic>.from(classes!.map((x) => x.toJson())),
    "title": title == null ? null : title,
    "shouldShowProgress":
    shouldShowProgress == null ? null : shouldShowProgress,
    "shouldShowNumClasses":
    shouldShowNumClasses == null ? null : shouldShowNumClasses,
    "lastClassTime": lastClassTime == null ? null : lastClassTime,
  };
}

class ClassListCardModel {
  ClassListCardModel({
    this.ageRange,
    this.title,
    this.dateTime,
    this.mentorFullName,
    this.mentorGender,
    this.classType,
    this.classTypeColor,
    this.percentageWatched,
    this.duration,
    this.attendanceCount,
    this.programTitle,
    this.classNum,
    this.programContinuityType,
    this.minutes,
    this.coverPicture,
    this.coverPicture2By1,
    this.coverPicture3By2,
  });

  MinMax? ageRange;
  String? title;
  DateTime? dateTime;
  String? mentorFullName;
  String? mentorGender;
  String? classType;
  String? classTypeColor;
  double? percentageWatched;
  int? duration;
  int? attendanceCount;
  String? programTitle;
  String? classNum;
  String? programContinuityType;
  List<int>? minutes;
  ImageModel? coverPicture;
  ImageModel? coverPicture2By1;
  ImageModel? coverPicture3By2;

  factory ClassListCardModel.fromJson(Map<String, dynamic> json) =>
      ClassListCardModel(
        ageRange:
        json["ageRange"] == null ? null : MinMax.fromMap(json["ageRange"]),
        title: json["title"] == null ? null : json["title"],
        dateTime:
        json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        mentorFullName:
        json["mentorFullName"] == null ? null : json["mentorFullName"],
        classType: json["classType"] == null ? null : json["classType"],
        classTypeColor:
        json["classTypeColor"] == null ? null : json["classTypeColor"],
        mentorGender:
        json["mentorGender"] == null ? null : json["mentorGender"],
        percentageWatched: json["percentageWatched"] == null
            ? null
            : json["percentageWatched"].toDouble(),
        duration: json["duration"] == null ? null : json["duration"],
        attendanceCount:
        json["attendanceCount"] == null ? null : json["attendanceCount"],
        programTitle:
        json["programTitle"] == null ? null : json["programTitle"],
        classNum: json["classNum"] == null ? null : json["classNum"],
        programContinuityType: json["programContinuityType"] == null
            ? null
            : json["programContinuityType"],
        minutes: json["minutes"] == null
            ? null
            : List<int>.from(json["minutes"].map((x) => x)),
        coverPicture: json["coverPicture"] == null
            ? null
            : ImageModel.fromMap(json["coverPicture"]),
        coverPicture2By1: json["coverPicture2By1"] == null
            ? null
            : ImageModel.fromMap(json["coverPicture2By1"]),
        coverPicture3By2: json["coverPicture3By2"] == null
            ? null
            : ImageModel.fromMap(json["coverPicture3By2"]),
      );

  Map<String, dynamic> toJson() => {
    "ageRange": ageRange == null ? null : ageRange!.toMap(),
    "title": title == null ? null : title,
    "dateTime": dateTime == null ? null : dateTime!.toIso8601String(),
    "mentorFullName": mentorFullName == null ? null : mentorFullName,
    "mentorGender": mentorGender == null ? null : mentorGender,
    "percentageWatched":
    percentageWatched == null ? null : percentageWatched,
    "duration": duration == null ? null : duration,
    "attendanceCount": attendanceCount == null ? null : attendanceCount,
    "programTitle": programTitle == null ? null : programTitle,
    "classNum": classNum == null ? null : classNum,
    "programContinuityType":
    programContinuityType == null ? null : programContinuityType,
    "minutes": minutes == null ? null : minutes,
    "coverPicture": coverPicture == null ? null : coverPicture!.toMap(),
    "coverPicture2By1":
    coverPicture2By1 == null ? null : coverPicture2By1!.toMap(),
    "coverPicture3By2":
    coverPicture3By2 == null ? null : coverPicture3By2!.toMap(),
  };
}
class MinMax {
  MinMax({
    this.min,
    this.max,
  });

  int? min;
  int? max;

  factory MinMax.fromMap(Map<String, dynamic> json) => MinMax(
    min: json["min"] == null ? null : json["min"],
    max: json["max"] == null ? null : json["max"],
  );

  Map<String, dynamic> toMap() => {
    "min": min,
    "max": max,
  };
}

class AvailableAgeRangesModel {
  AvailableAgeRangesModel({
    this.v1GetAvailableAgeRanges,
  });

  List<V1GetAvailableAgeRange>? v1GetAvailableAgeRanges;

  factory AvailableAgeRangesModel.fromJson(Map<String, dynamic> json) =>
      AvailableAgeRangesModel(
        v1GetAvailableAgeRanges: json["v1GetAvailableAgeRanges"] == null
            ? null
            : List<V1GetAvailableAgeRange>.from(json["v1GetAvailableAgeRanges"]
            .map((x) => V1GetAvailableAgeRange.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "v1GetAvailableAgeRanges": v1GetAvailableAgeRanges == null
        ? null
        : List<dynamic>.from(
        v1GetAvailableAgeRanges!.map((x) => x.toJson())),
  };
}

class V1GetAvailableAgeRange {
  V1GetAvailableAgeRange({
    this.label,
    this.values,
  });

  String? label;
  MinMax? values;

  factory V1GetAvailableAgeRange.fromJson(Map<String, dynamic> json) =>
      V1GetAvailableAgeRange(
        label: json["label"] == null ? null : json["label"],
        values: json["values"] == null ? null : MinMax.fromMap(json["values"]),
      );

  Map<String, dynamic> toJson() => {
    "label": label == null ? null : label,
    "values": values == null ? null : values!.toMap(),
  };
}
