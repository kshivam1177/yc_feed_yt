import 'package:yc_app/shared/models/homepage/homepage_section.model.dart';

class GetHomePageResponse {
  List<HomePageSection>? getHomePageData;

  GetHomePageResponse({this.getHomePageData});

  GetHomePageResponse.fromJson(Map<String, dynamic> json) {
    if (json['getHomePageData'] != null) {
      getHomePageData = <HomePageSection>[];
      json['getHomePageData'].forEach((v) {
        getHomePageData!.add(HomePageSection.fromJson(v));
      });
    }
  }
}
