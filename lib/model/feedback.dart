import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';

@JsonSerializable()
class Feedback {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'student_id')
  final String student_id;

  @JsonKey(name: 'course_id')
  final String course_id;

  @JsonKey(name: "teacher_id")
  final String teacher_id;

  Feedback(
      {required this.id,
      required this.student_id,
      required this.course_id,
      required this.teacher_id});

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
