// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoryBoth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryBoth _$HistoryBothFromJson(Map<String, dynamic> json) => HistoryBoth(
      id: json['id'] as int,
      user_id: json['user_id'] as int,
      round_id: json['round_id'] as int,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$HistoryBothToJson(HistoryBoth instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'round_id': instance.round_id,
      'status': instance.status,
    };
