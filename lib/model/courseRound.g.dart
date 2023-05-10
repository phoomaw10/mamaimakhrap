// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courseRound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseRound _$CourseRoundFromJson(Map<String, dynamic> json) => CourseRound(
      id: json['id'] as int,
      course_id: json['course_id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      maxStudent: json['maxStudent'] as int,
      history: json['histories'] == null
          ? null
          : HistoryBoth.fromJson(json['histories'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseRoundToJson(CourseRound instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.course_id,
      'createdAt': instance.createdAt.toIso8601String(),
      'maxStudent': instance.maxStudent,
      'histories': instance.history,
    };
