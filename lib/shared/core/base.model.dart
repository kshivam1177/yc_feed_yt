import 'package:flutter/foundation.dart';

import 'package:yc_app/shared/core/app_state.dart';

class BaseModel with ChangeNotifier {
  AppState appState = AppState.Idle;

  setErrorText(error) {
    for (var item in error["errors"]) {
      // print(['item', item]);
      notifyListeners();
    }
  }

  setSuccessText(successText) {
    // print(['successText', successText]);
    notifyListeners();
  }

  AppState get getAppState => appState;

  void setAppState(AppState state) {
    appState = state;
    notifyListeners();
  }
}
