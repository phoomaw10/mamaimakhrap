import 'package:json_annotation/json_annotation.dart';
import 'package:mamaimakhrap/model/HistoryBoth.dart';

part 'courseRound.g.dart';

@JsonSerializable()
class CourseRound {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'course_id')
  final int course_id;

  @JsonKey(name: 'createdAt')
  final String createdAt;

  @JsonKey(name: 'maxStudent')
  final int maxStudent;

  @JsonKey(name: 'histories')
  final List<HistoryBoth>? history;

  CourseRound(
      {required this.id,
      required this.course_id,
      required this.createdAt,
      required this.maxStudent,
      this.history});

  factory CourseRound.fromJson(Map<String, dynamic> json) =>
      _$CourseRoundFromJson(json);

  Map<String, dynamic> toJson() => _$CourseRoundToJson(this);
}
