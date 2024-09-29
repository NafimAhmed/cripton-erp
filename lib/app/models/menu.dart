import 'dart:convert';

import 'package:flutter/widgets.dart';

class MenuModel {
  String titile;
  String icon;
  String? route;
  MenuModel({
    required this.titile,
    required this.icon,
    this.route,
  });

  MenuModel copyWith({
    String? titile,
    String? icon,
    ValueGetter<String?>? route,
  }) {
    return MenuModel(
      titile: titile ?? this.titile,
      icon: icon ?? this.icon,
      route: route != null ? route() : this.route,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titile': titile,
      'icon': icon,
      'route': route,
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      titile: map['titile'] ?? '',
      icon: map['icon'] ?? '',
      route: map['route'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) =>
      MenuModel.fromMap(json.decode(source));

  @override
  String toString() => 'MenuModel(titile: $titile, icon: $icon, route: $route)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuModel &&
        other.titile == titile &&
        other.icon == icon &&
        other.route == route;
  }

  @override
  int get hashCode => titile.hashCode ^ icon.hashCode ^ route.hashCode;
}
