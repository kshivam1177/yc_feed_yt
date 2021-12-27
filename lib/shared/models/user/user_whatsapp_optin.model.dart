import 'package:meta/meta.dart';

class UserWaOptinInput {
  UserWaOptinInput({
    required this.mobile,
    this.userId,
    required this.optInStatus,
  });

  String? mobile;
  String? userId;
  bool? optInStatus;

  Map<String, dynamic> toJson() => {
        "mobile": mobile == null ? null : mobile,
        "userId": userId == null ? null : userId,
        "optInStatus": optInStatus == null ? null : optInStatus,
      };
}

class WaOptinResponse {
  WaOptinResponse({
    this.getUserWaOptinStatus,
  });

  GetUserWaOptinStatus? getUserWaOptinStatus;

  factory WaOptinResponse.fromJson(Map<String, dynamic> json) =>
      WaOptinResponse(
        getUserWaOptinStatus: json["getUserWAOptinStatus"] == null
            ? null
            : GetUserWaOptinStatus.fromMap(json["getUserWAOptinStatus"]),
      );
}

class GetUserWaOptinStatus {
  GetUserWaOptinStatus({
    this.status,
  });

  bool? status;

  factory GetUserWaOptinStatus.fromMap(Map<String, dynamic> json) =>
      GetUserWaOptinStatus(
        status: json["status"],
      );
}

class GetUserWaOptinStatusRequest {
  GetUserWaOptinStatusRequest({
    this.mobile,
  });

  String? mobile;

  Map<String, dynamic> toMap() => {
        "mobile": mobile,
      };
}
