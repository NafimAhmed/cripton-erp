// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationModel {
  String? title;
  int? counts;
  String? header;
  String? details;
  String? targetURL;
  NotificationModel({
    this.title,
    this.counts,
    this.header,
    this.details,
    this.targetURL,
  });

  NotificationModel copyWith({
    String? title,
    int? counts,
    String? header,
    String? details,
    String? targetURL,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      counts: counts ?? this.counts,
      header: header ?? this.header,
      details: details ?? this.details,
      targetURL: targetURL ?? this.targetURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'counts': counts,
      'header': header,
      'details': details,
      'targetURL': targetURL,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] != null ? map['title'] as String : null,
      counts: map['counts'] != null ? map['counts'] as int : null,
      header: map['header'] != null ? map['header'] as String : null,
      details: map['details'] != null ? map['details'] as String : null,
      targetURL: map['targetURL'] != null ? map['targetURL'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationModel(title: $title, counts: $counts, header: $header, details: $details, targetURL: $targetURL)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.counts == counts &&
        other.header == header &&
        other.details == details &&
        other.targetURL == targetURL;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        counts.hashCode ^
        header.hashCode ^
        details.hashCode ^
        targetURL.hashCode;
  }
}
