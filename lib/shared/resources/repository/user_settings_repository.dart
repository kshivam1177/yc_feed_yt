import 'package:meta/meta.dart';

import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/models/user/user_whatsapp_optin.model.dart';
import 'package:yc_app/shared/resources/api_provider/user_settings_api_provider.dart';

class UserSettingsRepository {
  final UserSettingsApiProvider _userSettingsApiProvider =
      UserSettingsApiProvider();

  ///update user whatsApp Opt In setting
  Future<ApiState> settingsWhatsAppOptIn({
    required UserWaOptinInput userWaOptinInput,
    List<String>? excludeParams,
  }) =>
      _userSettingsApiProvider.settingsWhatsAppOptIn(
          userWaOptinInput: userWaOptinInput);

  Future<ApiState> getWhatsAppOptIn(
          {required GetUserWaOptinStatusRequest getUserWaOptinStatusRequest}) =>
      _userSettingsApiProvider.getWhatsAppOptIn(
          getUserWaOptinStatusRequest: getUserWaOptinStatusRequest);
}

final UserSettingsRepository userSettingsRepository = UserSettingsRepository();
