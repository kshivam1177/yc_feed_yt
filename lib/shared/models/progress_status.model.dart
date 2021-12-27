// To parse this JSON data, do
//
//     final progressStatus = progressStatusFromMap(jsonString);

import 'dart:convert';

ProgressStatus progressStatusFromMap(String str) =>
    ProgressStatus.fromMap(json.decode(str));

String progressStatusToMap(ProgressStatus data) => json.encode(data.toMap());

class ProgressStatus {
  ProgressStatus({
    this.completionPercentage,
    this.progressText,
    this.missedClassesText,
    this.missedClassesBulletColor,
    this.attendedClassesText,
    this.attendedClassesBulletColor,
    this.certificateDetails,
  });

  int? completionPercentage;
  String? progressText;
  String? missedClassesText;
  String? missedClassesBulletColor;
  dynamic? attendedClassesText;
  String? attendedClassesBulletColor;
  CertificateDetails? certificateDetails;

  factory ProgressStatus.fromMap(Map<String, dynamic> json) => ProgressStatus(
        completionPercentage: json["completionPercentage"] == null
            ? null
            : json["completionPercentage"],
        progressText:
            json["progressText"] == null ? null : json["progressText"],
        missedClassesText: json["missedClassesText"] == null
            ? null
            : json["missedClassesText"],
        missedClassesBulletColor: json["missedClassesBulletColor"] == null
            ? null
            : json["missedClassesBulletColor"],
        attendedClassesText: json["attendedClassesText"],
        attendedClassesBulletColor: json["attendedClassesBulletColor"] == null
            ? null
            : json["attendedClassesBulletColor"],
        certificateDetails: json["certificateDetails"] == null
            ? null
            : CertificateDetails.fromMap(json["certificateDetails"]),
      );

  Map<String, dynamic> toMap() => {
        "completionPercentage":
            completionPercentage == null ? null : completionPercentage,
        "progressText": progressText == null ? null : progressText,
        "missedClassesText":
            missedClassesText == null ? null : missedClassesText,
        "missedClassesBulletColor":
            missedClassesBulletColor == null ? null : missedClassesBulletColor,
        "attendedClassesText": attendedClassesText,
        "attendedClassesBulletColor": attendedClassesBulletColor == null
            ? null
            : attendedClassesBulletColor,
        "certificateDetails":
            certificateDetails == null ? null : certificateDetails?.toMap(),
      };
}

class CertificateDetails {
  CertificateDetails({
    this.id,
    this.imageUrl,
    this.tickImageUrl,
    this.lockImageUrl,
    this.shareText,
    this.viewCertificateUrl,
  });

  dynamic? id;
  String? imageUrl;
  String? tickImageUrl;
  String? lockImageUrl;
  dynamic? shareText;
  dynamic? viewCertificateUrl;

  factory CertificateDetails.fromMap(Map<String, dynamic> json) =>
      CertificateDetails(
        id: json["id"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        tickImageUrl:
            json["tickImageUrl"] == null ? null : json["tickImageUrl"],
        lockImageUrl:
            json["lockImageUrl"] == null ? null : json["lockImageUrl"],
        shareText: json["shareText"],
        viewCertificateUrl: json["viewCertificateUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "tickImageUrl": tickImageUrl == null ? null : tickImageUrl,
        "lockImageUrl": lockImageUrl == null ? null : lockImageUrl,
        "shareText": shareText,
        "viewCertificateUrl": viewCertificateUrl,
      };
}
