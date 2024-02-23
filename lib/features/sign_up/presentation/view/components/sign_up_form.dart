import 'package:docdoc/core/extensions/navigation.dart';
import 'package:docdoc/core/functions/show_custom_error.dart';
import 'package:docdoc/core/helpers/regex.dart';
import 'package:docdoc/core/router/route_paths.dart';
import 'package:docdoc/core/themes/colors.dart';
import 'package:docdoc/core/widgets/custom_elevated_button.dart';
import 'package:docdoc/core/widgets/custom_text_form_field.dart';
import 'package:docdoc/core/widgets/password_validations.dart';
import 'package:docdoc/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:docdoc/features/sign_up/presentation/controller/sign_up_cubit.dart';
import 'package:docdoc/features/sign_up/presentation/controller/sign_up_state.dart';
import 'package:docdoc/features/sign_up/presentation/view/components/phone_number_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObsecureText = true;
  bool isPasswordConfirmationObsecure = true;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController passwordConfirmationController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharater = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = Regex.hasLowerCase(passwordController.text);
        hasUpperCase = Regex.hasUpperCase(passwordController.text);
        hasSpecialCharater = Regex.hasSpecialCharacter(passwordController.text);
        hasNumber = Regex.hasNumber(passwordController.text);
        hasMinLength = Regex.hasMinLength(passwordController.text);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoading ||
          current is SignUpSuccess ||
          current is SignUpError,
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
          success: (regiserResponse) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              RoutePaths.homeScreen,
              (route) => true,
            );
          },
          error: (error) {
            context.pop();
            showCustomError(context, error);
          },
        );
      },
      child: Form(
        key: _key,
        child: Column(
          children: [
            CustomTextFormField(
              controller: nameController,
              hintText: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid name';
                }
              },
            ),
            18.verticalSpace,
            CustomTextFormField(
              controller: emailController,
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
            PhoneNumberFormField(
              controller: phoneController,
              validator: (value) {
                if (value == null ||
                    value.number.isEmpty ||
                    !Regex.isPhoneNumberValid(value.number)) {
                  return 'Please enter valid phone number';
                }
                return null;
              },
            ),
            18.verticalSpace,
            CustomTextFormField(
              controller: passwordController,
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
            18.verticalSpace,
            CustomTextFormField(
              controller: passwordConfirmationController,
              hintText: 'Password Confirmation',
              isObsecureText: isPasswordConfirmationObsecure,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordConfirmationObsecure =
                        !isPasswordConfirmationObsecure;
                  });
                },
                icon: Icon(
                  isPasswordConfirmationObsecure
                      ? Icons.visibility_off
                      : Icons.visibility_rounded,
                  color: isPasswordConfirmationObsecure
                      ? ColorUtils.grey
                      : ColorUtils.primary,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid password';
                }
              },
            ),
            18.verticalSpace,
            PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharater: hasSpecialCharater,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
            40.verticalSpace,
            CustomElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  context.read<SignUpCubit>().signUp(
                        SignUpRequestBody(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          password: passwordController.text,
                          passwordConfirmation:
                              passwordConfirmationController.text,
                        ),
                      );
                }
              },
              buttonText: 'Create Account',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }
}
