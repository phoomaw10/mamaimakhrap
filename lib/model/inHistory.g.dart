// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inHistory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

inHistory _$inHistoryFromJson(Map<String, dynamic> json) => inHistory(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      join_code: json['join_code'] as String,
    );

Map<String, dynamic> _$inHistoryToJson(inHistory instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'join_code': instance.join_code,
    };
