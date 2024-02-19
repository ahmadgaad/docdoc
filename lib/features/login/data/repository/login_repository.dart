import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/features/login/data/models/login_request_body.dart';
import 'package:docdoc/features/login/data/models/login_response.dart';

abstract class LoginRepo {
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body);
}

class LoginRepoImpl implements LoginRepo {
  final ApiService _apiService;

  LoginRepoImpl({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _apiService.login(body);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
