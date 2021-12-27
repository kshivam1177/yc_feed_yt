
import 'package:flutter/material.dart';
import 'package:yc_app/modules/home/pre_login/pre_login_dashboard.dart';
import 'package:yc_app/utils/common_helpers.dart';

class NewDashboardEntry extends StatefulWidget {
  @override
  _NewDashboardEntryState createState() => _NewDashboardEntryState();
}

class _NewDashboardEntryState extends State<NewDashboardEntry> {
  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   if (CommonHelpers.isUserLoggedIn()) {
    //     // SharedViews.showDevToast(msg: "profilesBloc.getProfileDetails: Called");
    //     profilesBloc.getProfileDetails(withPlanet: true).then((value) {
    //       // gamificationAlertBloc.getPendingAlertsFromServer();
    //       // gamificationAlertBloc.refreshGameProfileHive();
    //     });
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:HomePage(key: UniqueKey()),
    );
  }
}
