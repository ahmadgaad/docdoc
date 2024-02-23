import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String message;
  @JsonKey(name: 'data')
  final User user;
  final bool status;
  final int code;

  SignUpResponse({
    required this.message,
    required this.user,
    required this.status,
    required this.code,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class User {
  final String token;
  @JsonKey(name: 'username')
  final String user;

  User({required this.token, required this.user});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
