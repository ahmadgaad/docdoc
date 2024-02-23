import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String message;
  @JsonKey(name: 'data')
  final User user;
  final bool status;
  final int code;

  LoginResponse({
    required this.message,
    required this.user,
    required this.status,
    required this.code,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class User {
  final String token;
  @JsonKey(name: 'username')
  final String user;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User({required this.token, required this.user});
}
