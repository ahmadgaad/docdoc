import 'package:docdoc/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:docdoc/features/sign_up/data/repository/sign_up_repository.dart';
import 'package:docdoc/features/sign_up/presentation/controller/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _signUpRepository;
  SignUpCubit(this._signUpRepository) : super(const SignUpState.initial());

  Future<void> signUp(SignUpRequestBody body) async {
    emit(const SignUpState.loading());
    final result = await _signUpRepository.signUp(body);
    result.when(
      success: (signUpResponse) {
        emit(SignUpState.success(signUpResponse));
      },
      failure: (error) {
        emit(
          SignUpState.error(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}
