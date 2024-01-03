import 'package:json_annotation/json_annotation.dart';

import 'student.dart';

part 'student_model.g.dart';

@JsonSerializable()
class StudentModel {
  final List<Student>? students;

  const StudentModel({this.students});

  @override
  String toString() => 'StudentModel(students: $students)';

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return _$StudentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StudentModelToJson(this);

  StudentModel copyWith({
    List<Student>? students,
  }) {
    return StudentModel(
      students: students ?? this.students,
    );
  }
}
