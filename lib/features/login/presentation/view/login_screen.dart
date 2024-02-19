import 'package:docdoc/core/extensions/navigation.dart';
import 'package:docdoc/core/functions/show_custom_error.dart';
import 'package:docdoc/core/router/route_paths.dart';
import 'package:docdoc/core/themes/colors.dart';
import 'package:docdoc/core/themes/styles.dart';
import 'package:docdoc/core/widgets/custom_elevated_button.dart';
import 'package:docdoc/features/login/presentation/controller/login_cubit.dart';
import 'package:docdoc/features/login/presentation/controller/login_state.dart';
import 'package:docdoc/features/login/presentation/view/components/already_have_account_text.dart';
import 'package:docdoc/features/login/presentation/view/components/email_and_password.dart';
import 'package:docdoc/features/login/presentation/view/components/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 34.w),
        child: SingleChildScrollView(
          child: BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                current is Loading || current is Success || current is Error,
            listener: (context, state) {
              state.whenOrNull(
                loading: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorUtils.primary,
                        ),
                      );
                    },
                  );
                },
                success: (loginResponse) {
                  context.pop();
                  context.pushNamedAndRemoveUntil(
                    RoutePaths.homeScreen,
                    (route) => true,
                  );
                },
                error: (error) {
                  showCustomError(context, error);
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyles.font24BlueBold,
                ),
                10.verticalSpace,
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GreyRegular,
                ),
                40.verticalSpace,
                Column(
                  children: [
                    const EmailAndPassword(),
                    24.verticalSpace,
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    40.verticalSpace,
                    CustomElevatedButton(
                      onPressed: () {
                        final key = context.read<LoginCubit>().formKey;
                        if (key.currentState!.validate()) {
                          context.read<LoginCubit>().login();
                        }
                      },
                      buttonText: 'Login',
                    ),
                    16.verticalSpace,
                    const TermsAndConditionsText(),
                    50.verticalSpace,
                    const AlreadyHaveAccountText(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
