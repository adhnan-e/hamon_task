import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'classroom.g.dart';

@JsonSerializable()
class Classroom {
  final int? id;
  final String? layout;
  final String? name;
  final int? size;

  const Classroom({this.id, this.layout, this.name, this.size});

  @override
  String toString() {
    return 'Classroom(id: $id, layout: $layout, name: $name, size: $size)';
  }

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return _$ClassroomFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClassroomToJson(this);

  Classroom copyWith({
    int? id,
    String? layout,
    String? name,
    int? size,
  }) {
    return Classroom(
      id: id ?? this.id,
      layout: layout ?? this.layout,
      name: name ?? this.name,
      size: size ?? this.size,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Classroom) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ layout.hashCode ^ name.hashCode ^ size.hashCode;
}
