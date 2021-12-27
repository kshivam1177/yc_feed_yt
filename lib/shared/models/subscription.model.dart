class SubscriptionPageRequest {
  String refCode;
  SubscriptionPageRequest(this.refCode);
  Map<String, dynamic> toMap() => {
        "refCode": refCode == null ? null : refCode,
      };
}

class SubscriptionPageResponse {
  SubscriptionPageResponse({this.applyRefCode});

  ApplyRefCode? applyRefCode;

  factory SubscriptionPageResponse.fromMap(Map<String, dynamic> json) =>
      SubscriptionPageResponse(
          applyRefCode: json["applyRefCode"] == null
              ? null
              : ApplyRefCode.fromMap(json["applyRefCode"]));
}

class ApplyRefCode {
  ApplyRefCode({
    this.msg,
    this.status,
  });
  String? msg;
  bool? status;
  factory ApplyRefCode.fromMap(Map<String, dynamic> json) => ApplyRefCode(
        msg: json["msg"],
        status: json["status"],
      );
}
