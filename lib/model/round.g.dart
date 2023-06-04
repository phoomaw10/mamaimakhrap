// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Round _$RoundFromJson(Map<String, dynamic> json) => Round(
      id: json['id'] as int,
      course_id: json['course_id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      endAt: json['endAt'] as String,
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      historyRound: (json['histories'] as List<dynamic>?)
          ?.map((e) => HistoryRound.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoundToJson(Round instance) => <String, dynamic>{
      'id': instance.id,
      'course_id': instance.course_id,
      'createdAt': instance.createdAt.toIso8601String(),
      'endAt': instance.endAt,
      'course': instance.course,
      'histories': instance.historyRound,
    };
