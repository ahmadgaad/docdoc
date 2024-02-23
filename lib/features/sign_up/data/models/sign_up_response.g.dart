// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      message: json['message'] as String,
      user: User.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool,
      code: json['code'] as int,
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.user,
      'status': instance.status,
      'code': instance.code,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      token: json['token'] as String,
      user: json['username'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'token': instance.token,
      'username': instance.user,
    };
