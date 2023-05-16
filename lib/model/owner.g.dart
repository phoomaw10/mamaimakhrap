// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: json['id'] as int,
      userId: json['uid'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      faculty: json['faculty'] as String,
      department: json['department'] as String,
      role: json['role'] as String,
      avatarURL: json['avatar_url'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.userId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'faculty': instance.faculty,
      'department': instance.department,
      'role': instance.role,
      'avatar_url': instance.avatarURL,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
