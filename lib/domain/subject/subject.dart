import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  final int? credits;
  final int? id;
  final String? name;
  final String? teacher;

  const Subject({this.credits, this.id, this.name, this.teacher});

  @override
  String toString() {
    return 'Subject(credits: $credits, id: $id, name: $name, teacher: $teacher)';
  }

  factory Subject.fromJson(Map<String, dynamic> json) {
    return _$SubjectFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  Subject copyWith({
    int? credits,
    int? id,
    String? name,
    String? teacher,
  }) {
    return Subject(
      credits: credits ?? this.credits,
      id: id ?? this.id,
      name: name ?? this.name,
      teacher: teacher ?? this.teacher,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Subject) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      credits.hashCode ^ id.hashCode ^ name.hashCode ^ teacher.hashCode;
}
