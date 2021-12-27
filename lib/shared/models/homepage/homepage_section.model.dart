import 'package:yc_app/shared/models/homepage/homepage_card.dart';

enum HomePageEntityEnum { CLASS, PROGRAM }

HomePageEntityEnum? homepageEnumFromString(String? s) {
  switch (s) {
    case "CLASS":
      return HomePageEntityEnum.CLASS;
    case "PROGRAM":
      return HomePageEntityEnum.PROGRAM;
    default:
      return null;
  }
}

class HomePageSection {
  String? headerKey;
  String? headerTitle;
  List<HomePageCard>? cards;
  HomePageEntityEnum? entityType;
  String? bgColor;
  String? txtColor;
  String? description;
  String? title;
  String? ctaType;
  String? deepLink;
  String? iconUrl;
  String? ctaUrl;

  HomePageSection({
    this.headerKey,
    this.headerTitle,
    this.cards,
    this.entityType,
    this.bgColor,
    this.txtColor,
    this.description,
    this.title,
    this.ctaType,
    this.deepLink,
    this.iconUrl,
    this.ctaUrl,
  });

  HomePageSection.fromJson(Map<String, dynamic> json) {
    headerKey = json['headerKey'];
    headerTitle = json['headerTitle'];
    cards = json['cards'] == null
        ? null
        : (json['cards'] as List).map((e) => HomePageCard.fromJson(e)).toList();
    entityType = homepageEnumFromString(json['entityType']);
  }
}
