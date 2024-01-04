import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_classroom.g.dart';

@JsonSerializable()
class SingleClassroom {
  final int? id;
  final String? layout;
  final String? name;
  final int? size;
  final dynamic? subject;

  const SingleClassroom({
    this.id,
    this.layout,
    this.name,
    this.size,
    this.subject,
  });

  @override
  String toString() {
    return 'SingleClassroom(id: $id, layout: $layout, name: $name, size: $size, subject: $subject)';
  }

  factory SingleClassroom.fromJson(Map<String, dynamic> json) {
    return _$SingleClassroomFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SingleClassroomToJson(this);

  SingleClassroom copyWith({
    int? id,
    String? layout,
    String? name,
    int? size,
    String? subject,
  }) {
    return SingleClassroom(
      id: id ?? this.id,
      layout: layout ?? this.layout,
      name: name ?? this.name,
      size: size ?? this.size,
      subject: subject ?? this.subject,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SingleClassroom) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      layout.hashCode ^
      name.hashCode ^
      size.hashCode ^
      subject.hashCode;
}
