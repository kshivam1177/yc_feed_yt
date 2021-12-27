import 'dart:convert';

import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/common_helpers.dart';

class StyledText {
  String text;
  String textColor;
  TStyle tStyle;

  StyledText({
    required this.text,
    this.tStyle = TStyle.B1_400,
    this.textColor = '',
  });

  StyledText copyWith({
    String? text,
    String? textColor,
    TStyle? tStyle,
  }) {
    return StyledText(
      text: text ?? this.text,
      textColor: textColor ?? this.textColor,
      tStyle: tStyle ?? this.tStyle,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'textColor': textColor,
      'tStyle': tStyle.toStr,
    };
  }

  factory StyledText.fromMap(Map<String, dynamic> map) {
    return StyledText(
      text: map['text'],
      textColor: map['textColor'],
      tStyle: CommonHelpers.enumFromString<TStyle>(
            TStyle.values,
            map['tStyle'],
          ) ??
          TStyle.B1_400,
    );
  }

  String toJson() => json.encode(toMap());

  factory StyledText.fromJson(String source) =>
      StyledText.fromMap(json.decode(source));

  @override
  String toString() =>
      'StyledTitle(text: $text, textColor: $textColor, tStyle: $tStyle)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StyledText &&
        other.text == text &&
        other.textColor == textColor &&
        other.tStyle == tStyle;
  }
}
