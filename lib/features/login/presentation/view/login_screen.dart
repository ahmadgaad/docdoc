import 'package:docdoc/core/themes/colors.dart';
import 'package:docdoc/core/themes/styles.dart';
import 'package:docdoc/core/widgets/custom_elevated_button.dart';
import 'package:docdoc/core/widgets/custom_text_form_field.dart';
import 'package:docdoc/features/login/presentation/view/widgets/already_have_account_text.dart';
import 'package:docdoc/features/login/presentation/view/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObsecureText = true;

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
                "Welcome Back",
                style: TextStyles.font24BlueBold,
              ),
              10.verticalSpace,
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14GreyRegular,
              ),
              40.verticalSpace,
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const CustomTextFormField(
                      hintText: 'Email',
                    ),
                    18.verticalSpace,
                    CustomTextFormField(
                      hintText: 'Password',
                      isObsecureText: isObsecureText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecureText = !isObsecureText;
                          });
                        },
                        icon: Icon(
                          isObsecureText
                              ? Icons.visibility_off
                              : Icons.visibility_rounded,
                          color: isObsecureText
                              ? ColorUtils.grey
                              : ColorUtils.primary,
                        ),
                      ),
                    ),
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
                      onPressed: () {},
                      buttonText: 'Login',
                    ),
                    16.verticalSpace,
                    const TermsAndConditionsText(),
                    60.verticalSpace,
                    const AlreadyHaveAccountText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
