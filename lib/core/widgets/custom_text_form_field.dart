import 'package:docdoc/core/themes/colors.dart';
import 'package:docdoc/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? isObsecureText;
  final EdgeInsetsGeometry? contentPadding;
  final String hintText;
  final Function(String? value) validator;
  final TextStyle? hintStyle;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.contentPadding,
    required this.hintText,
    required this.validator,
    this.suffixIcon,
    this.isObsecureText,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (e) => FocusScope.of(context).unfocus(),
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 17.h,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorUtils.lightGrey,
            width: 1.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorUtils.primary,
            width: 1.3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        suffixIcon: suffixIcon,
        hintStyle: hintStyle ?? TextStyles.font14LighterGreyRegular,
        hintText: hintText,
        filled: true,
        fillColor: ColorUtils.offWhite,
      ),
      obscureText: isObsecureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
    );
  }
}
