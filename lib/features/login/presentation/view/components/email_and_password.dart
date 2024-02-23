import 'package:docdoc/core/helpers/regex.dart';
import 'package:docdoc/core/themes/colors.dart';
import 'package:docdoc/core/widgets/custom_text_form_field.dart';
import 'package:docdoc/features/login/presentation/controller/login_cubit.dart';
import 'package:docdoc/core/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  bool isObsecureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = Regex.hasLowerCase(passwordController.text);
        hasUpperCase = Regex.hasUpperCase(passwordController.text);
        hasSpecialCharacter =
            Regex.hasSpecialCharacter(passwordController.text);
        hasNumber = Regex.hasNumber(passwordController.text);
        hasMinLength = Regex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !Regex.isEmailValid(value)) {
                return 'Please enter valid email';
              }
            },
          ),
          18.verticalSpace,
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
                color: isObsecureText ? ColorUtils.grey : ColorUtils.primary,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid password';
              }
            },
          ),
          24.verticalSpace,
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharater: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
