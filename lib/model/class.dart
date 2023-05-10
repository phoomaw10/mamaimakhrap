import 'package:json_annotation/json_annotation.dart';
import 'package:mamaimakhrap/model/courseRound.dart';

part 'class.g.dart';

@JsonSerializable()
class Course {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'join_code')
  final String join_code;

  @JsonKey(name: 'course_rounds')
  final CourseRound? courseRound;

  Course(
      {required this.id,
      required this.name,
      required this.code,
      required this.join_code,
      this.courseRound});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
