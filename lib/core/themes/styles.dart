import 'package:docdoc/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  TextStyles._();

  static TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    color: ColorUtils.primary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font13Grey400Weight = TextStyle(
    fontSize: 13.sp,
    color: ColorUtils.grey,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font16White600Weight = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}
