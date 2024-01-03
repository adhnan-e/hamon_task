import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'subject.dart';

part 'subject_model.g.dart';

@JsonSerializable()
class SubjectModel {
  final List<Subject>? subjects;

  const SubjectModel({this.subjects});

  @override
  String toString() => 'SubjectModel(subjects: $subjects)';

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return _$SubjectModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);

  SubjectModel copyWith({
    List<Subject>? subjects,
  }) {
    return SubjectModel(
      subjects: subjects ?? this.subjects,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SubjectModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => subjects.hashCode;
}
