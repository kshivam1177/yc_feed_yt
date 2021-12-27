import 'dart:convert';

import 'package:flutter/foundation.dart';

class NavbarData {
  final Navbar preLogin;
  final Navbar postLogin;

  NavbarData({
    required this.preLogin,
    required this.postLogin,
  });

  NavbarData copyWith({
    Navbar? preLogin,
    Navbar? postLogin,
  }) {
    return NavbarData(
      preLogin: preLogin ?? this.preLogin,
      postLogin: postLogin ?? this.postLogin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'preLogin': preLogin.toMap(),
      'postLogin': postLogin.toMap(),
    };
  }

  factory NavbarData.fromMap(Map<String, dynamic> map) {
    return NavbarData(
      preLogin: Navbar.fromMap(map['preLogin']),
      postLogin: Navbar.fromMap(map['postLogin']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NavbarData.fromJson(String source) =>
      NavbarData.fromMap(json.decode(source));

  @override
  String toString() => 'NavbarData(preLogin: $preLogin, postLogin: $postLogin)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NavbarData &&
        other.preLogin == preLogin &&
        other.postLogin == postLogin;
  }

  @override
  int get hashCode => preLogin.hashCode ^ postLogin.hashCode;
}

class Navbar {
  final List<NavButton> navItems;
  final String selectedItem;

  Navbar({
    required this.navItems,
    this.selectedItem = '',
  });

  Navbar copyWith({
    List<NavButton>? navItems,
    String? selectedItem,
  }) {
    return Navbar(
      navItems: navItems ?? this.navItems,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'navItems': navItems.map((x) => x.toMap()).toList(),
      'selectedItem': selectedItem,
    };
  }

  factory Navbar.fromMap(Map<String, dynamic> map) {
    return Navbar(
      navItems: List<NavButton>.from(
          map['navItems']?.map((x) => NavButton.fromMap(x))),
      selectedItem: map['selectedItem'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Navbar.fromJson(String source) => Navbar.fromMap(json.decode(source));

  @override
  String toString() =>
      'Navbar(navItems: $navItems, selectedItem: $selectedItem)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Navbar &&
        listEquals(other.navItems, navItems) &&
        other.selectedItem == selectedItem;
  }

  @override
  int get hashCode => navItems.hashCode ^ selectedItem.hashCode;
}

class NavButton {
  final String id;
  final String name;
  final String inactiveIcon;
  final String activeIcon;
  final String? pillText;
  final String? pillTxtColor;
  final String? pillBgColor;

  NavButton({
    required this.id,
    required this.name,
    required this.inactiveIcon,
    required this.activeIcon,
    this.pillText,
    this.pillTxtColor,
    this.pillBgColor,
  });

  NavButton copyWith({
    String? id,
    String? name,
    String? inactiveIcon,
    String? activeIcon,
    String? pillText,
    String? pillTxtColor,
    String? pillBgColor,
  }) {
    return NavButton(
      id: id ?? this.id,
      name: name ?? this.name,
      inactiveIcon: inactiveIcon ?? this.inactiveIcon,
      activeIcon: activeIcon ?? this.activeIcon,
      pillText: pillText ?? this.pillText,
      pillTxtColor: pillTxtColor ?? this.pillTxtColor,
      pillBgColor: pillBgColor ?? this.pillBgColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'inactiveIcon': inactiveIcon,
      'activeIcon': activeIcon,
      'pillText': pillText,
      'pillTxtColor': pillTxtColor,
      'pillBgColor': pillBgColor,
    };
  }

  factory NavButton.fromMap(Map<String, dynamic> map) {
    return NavButton(
      id: map['id'],
      name: map['name'],
      inactiveIcon: map['inactiveIcon'],
      activeIcon: map['activeIcon'],
      pillText: map['pillText'] != null ? map['pillText'] : null,
      pillTxtColor: map['pillTxtColor'] != null ? map['pillTxtColor'] : null,
      pillBgColor: map['pillBgColor'] != null ? map['pillBgColor'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NavButton.fromJson(String source) =>
      NavButton.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NavButton(id: $id, name: $name, inactiveIcon: $inactiveIcon, activeIcon: $activeIcon, pillText: $pillText, pillTxtColor: $pillTxtColor, pillBgColor: $pillBgColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NavButton &&
        other.id == id &&
        other.name == name &&
        other.inactiveIcon == inactiveIcon &&
        other.activeIcon == activeIcon &&
        other.pillText == pillText &&
        other.pillTxtColor == pillTxtColor &&
        other.pillBgColor == pillBgColor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        inactiveIcon.hashCode ^
        activeIcon.hashCode ^
        pillText.hashCode ^
        pillTxtColor.hashCode ^
        pillBgColor.hashCode;
  }
}
