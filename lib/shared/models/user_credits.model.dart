import 'package:flutter/foundation.dart';

class UserCreditsModel {
  final String? id;
  final int? credits;
  final int? creditsSpent;
  final bool? isContributionDone;

  UserCreditsModel({
    required this.id,
    required this.credits,
    required this.creditsSpent,
    required this.isContributionDone,
  });

  factory UserCreditsModel.fromJson(dynamic json) {
    return UserCreditsModel(
      id: json['id'],
      credits: json['credits'],
      creditsSpent: json['creditsSpent'],
      isContributionDone: json['isContributionDone'],
    );
  }

  Map toJson() => {
        'id': id,
        'credits': credits,
        'creditsSpent': creditsSpent,
        'isContributionDone': isContributionDone,
      };
}
