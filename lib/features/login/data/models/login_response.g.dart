// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String,
      user: User.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool,
      code: json['code'] as int,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.user,
      'status': instance.status,
      'code': instance.code,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      token: json['token'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
