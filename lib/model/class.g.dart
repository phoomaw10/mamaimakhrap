// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$ClassListFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      join_code: json['join_code'] as String,
    );

Map<String, dynamic> _$ClassListToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'join_code': instance.join_code,
    };