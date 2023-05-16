import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'firstname')
  final String firstname;

  @JsonKey(name: 'lastname')
  final String lastname;

  // @JsonKey(name: 'code')
  // final String code;

  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  // @JsonKey(name: 'join_code')
  // final String join_code;

  Teacher(
      {required this.id,
      required this.firstname,
      required this.lastname,
      // required this.code,
      // required this.join_code,
      required this.avatarUrl});

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
