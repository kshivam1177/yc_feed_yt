import 'package:yc_app/shared/models/user/user.model.dart';

class UpdateUserResponse {
  User? updateUser;

  UpdateUserResponse({this.updateUser});

  UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    updateUser =
        json['updateUser'] != null ? User.fromMap(json['updateUser']) : null;
  }
}
