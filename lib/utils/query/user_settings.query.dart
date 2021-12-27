class UserSettings {
  String whatsAppOptIn = """
  mutation updateWAOptinMutation(\$input: userWAOptinInput!) {
    updateWAOptin(params: \$input) {
      status
      msg
    }
  }
  """;
  String getWAOptinStatus = """
    query getUserWAOptinStatusQuery(\$mobile: String) {
      getUserWAOptinStatus(params: { mobile: \$mobile }) {
        status
      }
    }
  """;
}

final UserSettings userSettings = UserSettings();
