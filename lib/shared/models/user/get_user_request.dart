import 'package:flutter/material.dart';

class GetUserRequest {
  GetUserRequest({
    required this.userId,
  });

  String? userId;

  Map<String, dynamic> toMap() => {
        "userId": userId,
      };

  factory GetUserRequest.fromJson(Map<String, dynamic> json) => GetUserRequest(
        userId: json["userId"],
      );
}
