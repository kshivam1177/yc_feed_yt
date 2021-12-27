class Entity {
  Entity({
    this.id,
    this.title,
    this.type,
    this.ctaText,
  });

  String? id;
  String? title;
  Type? type;
  String? ctaText;

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        type: json["type"] == null ? null : typefromString(json["type"]),
        ctaText: json["ctaText"] == null ? null : json["ctaText"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "type": type == null ? null : type,
        "ctaText": ctaText == null ? null : ctaText,
      };
}

extension TypeToStringExtension on Type {
  String? get string {
    switch (this) {
      case Type.CLASS:
        return 'CLASS';
      case Type.PROGRAM:
        return 'PROGRAM';
      case Type.POST:
        return 'POST';
      default:
        return null;
    }
  }
}

Type? typefromString(String? type) {
  switch (type) {
    case "CLASS":
      return Type.CLASS;
    case "PROGRAM":
      return Type.PROGRAM;
    case "POST":
      return Type.POST;
    default:
      return null;
  }
}

enum Type { CLASS, PROGRAM, POST }
