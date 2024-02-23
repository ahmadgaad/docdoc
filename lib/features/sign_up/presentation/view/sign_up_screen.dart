import 'package:docdoc/core/themes/styles.dart';
import 'package:docdoc/features/login/presentation/view/components/terms_and_conditions_text.dart';
import 'package:docdoc/features/sign_up/presentation/view/components/already_have_account_text.dart';
import 'package:docdoc/features/sign_up/presentation/view/components/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 34.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyles.font24BlueBold,
              ),
              10.verticalSpace,
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: TextStyles.font14GreyRegular,
              ),
              40.verticalSpace,
              Column(
                children: [
                  const SignUpForm(),
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
    ));
  }
}
