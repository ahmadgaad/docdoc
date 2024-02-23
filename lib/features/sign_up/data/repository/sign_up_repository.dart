import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:docdoc/features/sign_up/data/models/sign_up_response.dart';

abstract class SignUpRepository {
  Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody body);
}

class SignUpRepositoryImpl implements SignUpRepository {
  final ApiService _apiService;

  SignUpRepositoryImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody body) async {
    try {
      final response = await _apiService.signUp(body);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
