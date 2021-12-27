import 'package:yc_app/shared/models/user/user.model.dart';

class GetUserResponse {
  User? getUser;

  GetUserResponse({this.getUser});

  GetUserResponse.fromJson(Map<String, dynamic> json) {
    getUser = json['getUser'] != null ? User.fromMap(json['getUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.getUser != null) {
      data['getUser'] = this.getUser!.toMap();
    }
    return data;
  }
}
