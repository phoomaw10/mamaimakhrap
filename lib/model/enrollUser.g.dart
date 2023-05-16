// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollUser _$EnrollUserFromJson(Map<String, dynamic> json) => EnrollUser(
      id: json['id'] as int?,
      userId: json['uid'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      faculty: json['faculty'] as String?,
      department: json['department'] as String?,
      role: json['role'] as String?,
      avatarURL: json['avatar_url'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$EnrollUserToJson(EnrollUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.userId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'faculty': instance.faculty,
      'department': instance.department,
      'role': instance.role,
      'avatar_url': instance.avatarURL,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
