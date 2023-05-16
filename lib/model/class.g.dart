// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int,
      name: json['name'] as String?,
      code: json['code'] as String?,
      join_code: json['join_code'] as String?,
      courseRound: (json['course_rounds'] as List<dynamic>?)
          ?.map((e) => CourseRound.fromJson(e as Map<String, dynamic>))
          .toList(),
      enrollUser: (json['enrolled_users'] as List<dynamic>?)
          ?.map((e) => EnrollUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'join_code': instance.join_code,
      'course_rounds': instance.courseRound,
      'enrolled_users': instance.enrollUser,
    };
