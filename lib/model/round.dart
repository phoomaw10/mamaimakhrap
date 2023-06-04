import 'package:json_annotation/json_annotation.dart';
import 'package:mamaimakhrap/model/class.dart';
import 'package:mamaimakhrap/model/histories.dart';
import 'package:mamaimakhrap/model/teacher.dart';

part 'round.g.dart';

@JsonSerializable()
class Round {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'course_id')
  final int course_id;

  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  @JsonKey(name: 'endAt')
  final String endAt;

  @JsonKey(name: 'course')
  final Course? course;

  @JsonKey(name: 'histories')
  final List<HistoryRound>? historyRound;

  Round(
      {required this.id,
      required this.course_id,
      required this.createdAt,
      required this.endAt,
      this.course,
      this.historyRound});

  factory Round.fromJson(Map<String, dynamic> json) => _$RoundFromJson(json);

  Map<String, dynamic> toJson() => _$RoundToJson(this);
}
