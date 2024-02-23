import 'dart:async';

import 'package:docdoc/core/themes/colors.dart';
import 'package:docdoc/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneNumberFormField extends StatelessWidget {
  final TextEditingController controller;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  const PhoneNumberFormField({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: "EG",
      dropdownIconPosition: IconPosition.trailing,
      validator: validator,
      disableLengthCheck: true,
      decoration: InputDecoration(
        hintMaxLines: null,
        errorMaxLines: null,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
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
        hintStyle: TextStyles.font14LighterGreyRegular,
        hintText: "Phone Number",
        filled: true,
        fillColor: ColorUtils.offWhite,
      ),
    );
  }
}
