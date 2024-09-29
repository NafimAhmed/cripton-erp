import 'dart:convert';

class ERPMenuModel {
  String titile;
  String icon;
  ERPMenuModel({
    required this.titile,
    required this.icon,
  });

  ERPMenuModel copyWith({
    String? titile,
    String? icon,
  }) {
    return ERPMenuModel(
      titile: titile ?? this.titile,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titile': titile,
      'icon': icon,
    };
  }

  factory ERPMenuModel.fromMap(Map<String, dynamic> map) {
    return ERPMenuModel(
      titile: map['titile'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ERPMenuModel.fromJson(String source) =>
      ERPMenuModel.fromMap(json.decode(source));

  @override
  String toString() => 'ERPMenuModel(titile: $titile, icon: $icon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ERPMenuModel &&
        other.titile == titile &&
        other.icon == icon;
  }

  @override
  int get hashCode => titile.hashCode ^ icon.hashCode;
}
