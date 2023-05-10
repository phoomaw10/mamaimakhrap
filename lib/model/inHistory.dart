import 'package:json_annotation/json_annotation.dart';

part 'inHistory.g.dart';

@JsonSerializable()
class inHistory {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'course_id')
  final int course_id;

  @JsonKey(name: 'createdAt')
  final String createAt;

  inHistory({
    required this.id,
    required this.course_id,
    required this.createAt,
  });

  factory inHistory.fromJson(Map<String, dynamic> json) =>
      _$inHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$inHistoryToJson(this);
}
