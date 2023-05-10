// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inHistory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

inHistory _$inHistoryFromJson(Map<String, dynamic> json) => inHistory(
      id: json['id'] as int,
      course_id: json['course_id'] as int,
      createAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$inHistoryToJson(inHistory instance) => <String, dynamic>{
      'id': instance.id,
      'course_id': instance.course_id,
      'createdAt': instance.createAt,
    };
