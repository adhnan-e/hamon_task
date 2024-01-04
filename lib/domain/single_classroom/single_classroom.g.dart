// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleClassroom _$SingleClassroomFromJson(Map<String, dynamic> json) =>
    SingleClassroom(
      id: json['id'] as int?,
      layout: json['layout'] as String?,
      name: json['name'] as String?,
      size: json['size'] as int?,
      subject: json['subject'],
    );

Map<String, dynamic> _$SingleClassroomToJson(SingleClassroom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'layout': instance.layout,
      'name': instance.name,
      'size': instance.size,
      'subject': instance.subject,
    };
