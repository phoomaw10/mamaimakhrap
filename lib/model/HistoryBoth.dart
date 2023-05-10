import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'HistoryBoth.g.dart';

@JsonSerializable()
class HistoryBoth {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'user_id')
  final int user_id;

  @JsonKey(name: 'round_id')
  final int round_id;

  @JsonKey(name: 'status')
  final bool status;

  HistoryBoth(
      {required this.id,
      required this.user_id,
      required this.round_id,
      required this.status});

  factory HistoryBoth.fromJson(Map<String, dynamic> json) =>
      _$HistoryBothFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryBothToJson(this);
}
