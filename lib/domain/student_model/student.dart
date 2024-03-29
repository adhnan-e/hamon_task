import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  final int? age;
  final String? email;
  final int? id;
  final String? name;

  const Student({this.age, this.email, this.id, this.name});

  @override
  String toString() {
    return 'Student(age: $age, email: $email, id: $id, name: $name)';
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return _$StudentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  Student copyWith({
    int? age,
    String? email,
    int? id,
    String? name,
  }) {
    return Student(
      age: age ?? this.age,
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
