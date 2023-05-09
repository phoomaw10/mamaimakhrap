import 'package:json_annotation/json_annotation.dart';

part 'class.g.dart';

@JsonSerializable()
class ClassList {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'join_code')
  final String join_code;

  ClassList(
      {required this.id,
      required this.name,
      required this.code,
      required this.join_code});

  factory ClassList.fromJson(Map<String, dynamic> json) =>
      _$ClassListFromJson(json);

  Map<String, dynamic> toJson() => _$ClassListToJson(this);
}
