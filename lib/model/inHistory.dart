import 'package:json_annotation/json_annotation.dart';

part 'inHistory.g.dart';

@JsonSerializable()
class inHistory {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'join_code')
  final String join_code;

  inHistory(
      {required this.id,
      required this.name,
      required this.code,
      required this.join_code});

  factory inHistory.fromJson(Map<String, dynamic> json) =>
      _$inHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$inHistoryToJson(this);
}
