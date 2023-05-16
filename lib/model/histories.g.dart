// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'histories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryRound _$HistoryRoundFromJson(Map<String, dynamic> json) => HistoryRound(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      round_id: json['round_id'] as int?,
      status: json['status'] as bool?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryRoundToJson(HistoryRound instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'round_id': instance.round_id,
      'status': instance.status,
      'owner': instance.owner,
    };
