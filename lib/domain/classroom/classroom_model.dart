import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'classroom.dart';

part 'classroom_model.g.dart';

@JsonSerializable()
class ClassroomModel {
  final List<Classroom>? classrooms;

  const ClassroomModel({this.classrooms});

  @override
  String toString() => 'ClassroomModel(classrooms: $classrooms)';

  factory ClassroomModel.fromJson(Map<String, dynamic> json) {
    return _$ClassroomModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClassroomModelToJson(this);

  ClassroomModel copyWith({
    List<Classroom>? classrooms,
  }) {
    return ClassroomModel(
      classrooms: classrooms ?? this.classrooms,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ClassroomModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => classrooms.hashCode;
}
