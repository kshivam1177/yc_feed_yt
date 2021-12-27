import 'dart:convert';

class Id {
  String? id;

  Id({
    this.id,
  });

  Id copyWith({
    String? id,
  }) {
    return Id(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory Id.fromMap(Map<String, dynamic> map) {
    return Id(
      id: map['id'] != null ? map['id'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Id.fromJson(String source) => Id.fromMap(json.decode(source));

  @override
  String toString() => 'Id(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Id && other.id == id;
  }
}
