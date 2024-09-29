// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsesPerpousModel {
  String? useText;
  String? useValue;
  UsesPerpousModel({
    this.useText,
    this.useValue,
  });

  UsesPerpousModel copyWith({
    String? useText,
    String? useValue,
  }) {
    return UsesPerpousModel(
      useText: useText ?? this.useText,
      useValue: useValue ?? this.useValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'useText': useText,
      'useValue': useValue,
    };
  }

  factory UsesPerpousModel.fromMap(Map<String, dynamic> map) {
    return UsesPerpousModel(
      useText: map['useText'] != null ? map['useText'] as String : null,
      useValue: map['useValue'] != null ? map['useValue'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsesPerpousModel.fromJson(String source) =>
      UsesPerpousModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '$useText';

  @override
  bool operator ==(covariant UsesPerpousModel other) {
    if (identical(this, other)) return true;

    return other.useText == useText && other.useValue == useValue;
  }

  @override
  int get hashCode => useText.hashCode ^ useValue.hashCode;
}
