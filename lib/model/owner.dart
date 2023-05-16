import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable()
class Owner {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'uid')
  final String userId;

  @JsonKey(name: 'firstname')
  final String firstname;

  @JsonKey(name: "lastname")
  final String lastname;

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "faculty")
  final String faculty;

  @JsonKey(name: "department")
  final String department;

  @JsonKey(name: "role")
  final String role;

  @JsonKey(name: "avatar_url")
  final String avatarURL;

  @JsonKey(name: "createdAt")
  final DateTime createdAt;

  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  Owner(
      {required this.id,
      required this.userId,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.faculty,
      required this.department,
      required this.role,
      required this.avatarURL,
      required this.createdAt,
      required this.updatedAt});

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
