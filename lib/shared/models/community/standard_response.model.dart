class StandardResponse {
  String? msg;
  bool? status;

  StandardResponse({this.msg, this.status});

  factory StandardResponse.fromJson(Map<String, dynamic> json) =>
      StandardResponse(
        msg: json['msg'],
        status: json['status'],
      );
}
