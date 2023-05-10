// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackList _$FeedbackListFromJson(Map<String, dynamic> json) => FeedbackList(
      id: json['id'] as int,
      student_id: json['student_id'] as int,
      feedbackText: json['feedbackText'] as String,
      course_id: json['course_id'] as int,
      teacher_id: json['teacher_id'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      teacher: json['teacher'] == null
          ? null
          : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackListToJson(FeedbackList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.student_id,
      'feedbackText': instance.feedbackText,
      'course_id': instance.course_id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'teacher_id': instance.teacher_id,
      'course': instance.course,
      'teacher': instance.teacher,
    };
