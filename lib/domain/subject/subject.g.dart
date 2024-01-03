// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      credits: json['credits'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      teacher: json['teacher'] as String?,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'credits': instance.credits,
      'id': instance.id,
      'name': instance.name,
      'teacher': instance.teacher,
    };
