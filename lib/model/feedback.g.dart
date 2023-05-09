// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) => Feedback(
      id: json['id'] as int,
      student_id: json['student_id'] as String,
      course_id: json['course_id'] as String,
      teacher_id: json['teacher_id'] as String,
    );

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
      'id': instance.id,
      'student_id': instance.student_id,
      'course_id': instance.course_id,
      'teacher_id': instance.teacher_id,
    };
