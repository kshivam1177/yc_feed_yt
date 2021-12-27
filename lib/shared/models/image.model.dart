import 'dart:convert';

class ImageModel {
  String? id;
  String? url;
  String? entityType;
  String? entityId;

  ImageModel({
    this.id,
    this.url,
    this.entityType,
    this.entityId,
  });

  ImageModel copyWith({
    String? id,
    String? url,
    String? entityType,
    String? entityId,
  }) {
    return ImageModel(
      id: id ?? this.id,
      url: url ?? this.url,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'entityType': entityType,
      'entityId': entityId,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] != null ? map['id'] : null,
      url: map['url'] != null ? map['url'] : null,
      entityType: map['entityType'] != null ? map['entityType'] : null,
      entityId: map['entityId'] != null ? map['entityId'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ImageModel(id: $id, url: $url, entityType: $entityType, entityId: $entityId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageModel &&
        other.id == id &&
        other.url == url &&
        other.entityType == entityType &&
        other.entityId == entityId;
  }
}
