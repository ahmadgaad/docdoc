import 'package:docdoc/core/themes/colors.dart';
import 'package:docdoc/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharater;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharater,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValidatedRow(
          text: "At least 1 lowercase character",
          hasValidated: hasLowerCase,
        ),
        2.verticalSpace,
        ValidatedRow(
          text: "At least 1 uppercase character",
          hasValidated: hasUpperCase,
        ),
        2.verticalSpace,
        ValidatedRow(
          text: "At least 1 special character",
          hasValidated: hasSpecialCharater,
        ),
        2.verticalSpace,
        ValidatedRow(
          text: "At least 1 number",
          hasValidated: hasNumber,
        ),
        2.verticalSpace,
        ValidatedRow(
          text: "At least 8 characters long",
          hasValidated: hasMinLength,
        ),
        2.verticalSpace,
      ],
    );
  }
}

class ValidatedRow extends StatelessWidget {
  final String text;
  final bool hasValidated;
  const ValidatedRow({
    super.key,
    required this.text,
    required this.hasValidated,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorUtils.grey,
        ),
        6.horizontalSpace,
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorUtils.grey : ColorUtils.darkBlue,
          ),
        )
      ],
    );
  }
}
