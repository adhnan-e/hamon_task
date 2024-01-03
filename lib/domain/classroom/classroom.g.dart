// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classroom _$ClassroomFromJson(Map<String, dynamic> json) => Classroom(
      id: json['id'] as int?,
      layout: json['layout'] as String?,
      name: json['name'] as String?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$ClassroomToJson(Classroom instance) => <String, dynamic>{
      'id': instance.id,
      'layout': instance.layout,
      'name': instance.name,
      'size': instance.size,
    };
