import 'package:json_annotation/json_annotation.dart';
import 'package:mamaimakhrap/model/courseRound.dart';
import 'package:mamaimakhrap/model/enrollUser.dart';

part 'class.g.dart';

@JsonSerializable()
class Course {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'code')
  final String? code;

  @JsonKey(name: 'join_code')
  final String? join_code;

  @JsonKey(name: 'course_rounds')
  final List<CourseRound>? courseRound;

  @JsonKey(name: 'enrolled_users')
  final List<EnrollUser>? enrollUser;

  Course(
      {required this.id,
      required this.name,
      required this.code,
      required this.join_code,
      this.courseRound,
      this.enrollUser});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
