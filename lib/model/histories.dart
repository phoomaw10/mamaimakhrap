
import 'package:json_annotation/json_annotation.dart';
import 'package:mamaimakhrap/model/owner.dart';
import 'package:mamaimakhrap/model/round.dart';

part 'histories.g.dart';

@JsonSerializable()
class HistoryRound {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'user_id')
  final int? user_id;

  @JsonKey(name: 'round_id')
  final int? round_id;

  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'owner')
  final Owner? owner;

  HistoryRound(
      {required this.id,
      required this.user_id,
      required this.round_id,
      required this.status,
      this.owner});

  factory HistoryRound.fromJson(Map<String, dynamic> json) =>
      _$HistoryRoundFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryRoundToJson(this);
}
