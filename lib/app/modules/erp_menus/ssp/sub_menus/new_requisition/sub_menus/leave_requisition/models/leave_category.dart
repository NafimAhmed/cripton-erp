// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LeaveCategoryModel {
  bool? disabled;
  String? group;
  bool? selected;
  String? text;
  String? value;
  LeaveCategoryModel({
    this.disabled,
    this.group,
    this.selected,
    this.text,
    this.value,
  });

  LeaveCategoryModel copyWith({
    bool? disabled,
    String? group,
    bool? selected,
    String? text,
    String? value,
  }) {
    return LeaveCategoryModel(
      disabled: disabled ?? this.disabled,
      group: group ?? this.group,
      selected: selected ?? this.selected,
      text: text ?? this.text,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'disabled': disabled,
      'group': group,
      'selected': selected,
      'text': text,
      'value': value,
    };
  }

  factory LeaveCategoryModel.fromMap(Map<String, dynamic> map) {
    return LeaveCategoryModel(
      disabled: map['disabled'] != null ? map['disabled'] as bool : null,
      group: map['group'] != null ? map['group'] as String : null,
      selected: map['selected'] != null ? map['selected'] as bool : null,
      text: map['text'] != null ? map['text'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeaveCategoryModel.fromJson(String source) =>
      LeaveCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '$text';
  }

  @override
  bool operator ==(covariant LeaveCategoryModel other) {
    if (identical(this, other)) return true;

    return other.disabled == disabled &&
        other.group == group &&
        other.selected == selected &&
        other.text == text &&
        other.value == value;
  }

  @override
  int get hashCode {
    return disabled.hashCode ^
        group.hashCode ^
        selected.hashCode ^
        text.hashCode ^
        value.hashCode;
  }
}
