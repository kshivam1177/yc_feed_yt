import 'package:yc_app/shared/models/image.model.dart';

enum GenderEnum { MALE, FEMALE, ANY }

GenderEnum? genderEnumFromString(String? s) {
  switch (s) {
    case "MALE":
      return GenderEnum.MALE;
    case "FEMALE":
      return GenderEnum.FEMALE;
    case "ANY":
      return GenderEnum.ANY;
    default:
      return null;
  }
}

class HomePageCard {
  HomePageCard(
      {this.id,
      this.classNum,
      this.title,
      this.coverPicture,
      this.coverPicture2By1,
      this.dateTime,
      this.duration,
      this.mentorName,
      this.mentorGender,
      this.programType,
      this.programContinuityType});

  String? id;
  String? classNum;
  String? title;
  ImageModel? coverPicture;
  ImageModel? coverPicture2By1;
  DateTime? dateTime;
  int? duration;
  String? mentorName;
  GenderEnum? mentorGender;
  String? programType;
  String? programContinuityType;

  factory HomePageCard.fromJson(Map<String, dynamic> json) => HomePageCard(
        id: json["id"],
        classNum: json["classNum"],
        title: json["title"],
        coverPicture: json["coverPicture"] == null
            ? null
            : ImageModel.fromMap(json["coverPicture"]),
        coverPicture2By1: json["coverPicture2By1"] == null
            ? null
            : ImageModel.fromMap(json["coverPicture2By1"]),
        dateTime: json["dateTime"] == null
            ? null
            : DateTime.parse(json["dateTime"]).toLocal(),
        duration: json["duration"],
        programType: json["programType"],
        programContinuityType: json["programContinuityType"],
        mentorName: json["mentorName"],
        mentorGender: json["mentorGender"] == null
            ? null
            : genderEnumFromString(json["mentorGender"]),
      );
}
