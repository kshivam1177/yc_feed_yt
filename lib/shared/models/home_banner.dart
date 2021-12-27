import 'package:yc_app/utils/common_helpers.dart';

class Banner {
  List<HomePageBanner>? v1getHomePageBanner;

  Banner({this.v1getHomePageBanner});

  Banner.fromJson(Map<String, dynamic> json) {
    if (json['v1getHomePageBanner'] != null) {
      v1getHomePageBanner = <HomePageBanner>[];
      json['v1getHomePageBanner'].forEach((v) {
        v1getHomePageBanner!.add(HomePageBanner.fromJson(v));
      });
    }
  }
}

class HomePageBanner {
  HomePageBanner({
    this.bannerImageWebUrl,
    this.bannerTitle,
    this.clickActionType,
    this.clickActionUrl,
    this.clickActionEntityType,
    this.clickActionEntityId,
  });

  String? bannerImageWebUrl;
  String? bannerTitle;
  String? clickActionType;
  String? clickActionUrl;
  ClickToActionTypes? clickActionEntityType;
  String? clickActionEntityId;

  factory HomePageBanner.fromJson(Map<String, dynamic> json) => HomePageBanner(
        bannerImageWebUrl: json["bannerImageWebUrl"],
        bannerTitle: json["bannerTitle"],
        clickActionType: json["clickActionType"],
        clickActionUrl: json["clickActionUrl"],
        clickActionEntityType: json["clickActionEntityType"] == null
            ? null
            : CommonHelpers.enumFromString(
                ClickToActionTypes.values, json["clickActionEntityType"]),
        clickActionEntityId: json["clickActionEntityID"] == null
            ? null
            : json["clickActionEntityID"],
      );
}

enum ClickToActionTypes {
  EXTERNAL_LINK,
  APP_LINK,
  PRODUCT_PAGE,
  WEBVIEW,
  DEFAULT,
  DISABLED,
  CLOSE,

  @Deprecated(
    'Use EXTERNAL_LINK instead. CAUTION: confirm with backend before changing',
  )
  ExternalLink,
  @Deprecated(
    'Use APP_LINK instead. CAUTION: confirm with backend before changing',
  )
  AppLink,
  @Deprecated(
    'Use PRODUCT_PAGE instead. CAUTION: confirm with backend before changing',
  )
  ProductPage,
}

extension CtaExt on ClickToActionTypes {
  String get toStr => this.toString().split(".").last;
}
