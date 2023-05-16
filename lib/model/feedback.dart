import 'package:json_annotation/json_annotation.dart';
import 'package:mamaimakhrap/model/class.dart';
import 'package:mamaimakhrap/model/teacher.dart';

part 'feedback.g.dart';

@JsonSerializable()
class FeedbackList {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'student_id')
  final int student_id;

  @JsonKey(name: 'feedbackText')
  final String? feedbackText;

  @JsonKey(name: 'course_id')
  final int course_id;

  @JsonKey(name: "createdAt")
  final String? createdAt;

  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  @JsonKey(name: "teacher_id")
  final int teacher_id;

  @JsonKey(name: "course")
  final Course? course;

  @JsonKey(name: "teacher")
  final Teacher? teacher;

  FeedbackList(
      {required this.id,
      required this.student_id,
      required this.feedbackText,
      required this.course_id,
      required this.teacher_id,
      required this.createdAt,
      required this.updatedAt,
      this.course,
      this.teacher});

  factory FeedbackList.fromJson(Map<String, dynamic> json) =>
      _$FeedbackListFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackListToJson(this);
}
