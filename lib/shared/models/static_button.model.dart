import 'dart:convert';

class StaticButton {
  ButtonCTA? buttonCTA;
  String? buttonText;

  StaticButton({
    this.buttonCTA,
    this.buttonText,
  });

  StaticButton copyWith({
    ButtonCTA? buttonCTA,
    String? buttonText,
  }) {
    return StaticButton(
      buttonCTA: buttonCTA ?? this.buttonCTA,
      buttonText: buttonText ?? this.buttonText,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'buttonCTA': buttonCTA?.toMap(),
      'buttonText': buttonText,
    };
  }

  factory StaticButton.fromMap(Map<String, dynamic> map) {
    return StaticButton(
      buttonCTA:
          map['buttonCTA'] != null ? ButtonCTA.fromMap(map['buttonCTA']) : null,
      buttonText: map['buttonText'] != null ? map['buttonText'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StaticButton.fromJson(String source) =>
      StaticButton.fromMap(json.decode(source));

  @override
  String toString() =>
      'StaticButton(buttonCTA: $buttonCTA, buttonText: $buttonText)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StaticButton &&
        other.buttonCTA == buttonCTA &&
        other.buttonText == buttonText;
  }
}

class ButtonCTA {
  String? ctaType;
  String? ctaUrl;

  ButtonCTA({
    this.ctaType,
    this.ctaUrl,
  });

  ButtonCTA copyWith({
    String? ctaType,
    String? ctaUrl,
  }) {
    return ButtonCTA(
      ctaType: ctaType ?? this.ctaType,
      ctaUrl: ctaUrl ?? this.ctaUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ctaType': ctaType,
      'ctaUrl': ctaUrl,
    };
  }

  factory ButtonCTA.fromMap(Map<String, dynamic> map) {
    return ButtonCTA(
      ctaType: map['ctaType'] != null ? map['ctaType'] : null,
      ctaUrl: map['ctaUrl'] != null ? map['ctaUrl'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ButtonCTA.fromJson(String source) =>
      ButtonCTA.fromMap(json.decode(source));

  @override
  String toString() => 'ButtonCTA(ctaType: $ctaType, ctaUrl: $ctaUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ButtonCTA &&
        other.ctaType == ctaType &&
        other.ctaUrl == ctaUrl;
  }
}
