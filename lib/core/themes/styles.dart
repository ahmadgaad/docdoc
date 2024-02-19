import 'package:docdoc/core/themes/colors.dart';
import 'package:docdoc/core/themes/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  TextStyles._();

  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    color: ColorUtils.darkBlue,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font13BlueRegular = TextStyle(
    fontSize: 13.sp,
    color: ColorUtils.primary,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    color: ColorUtils.primary,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font13GreyRegular = TextStyle(
    fontSize: 13.sp,
    color: ColorUtils.grey,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorUtils.grey,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14LighterGreyRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorUtils.lighterGrey,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    color: ColorUtils.primary,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13.sp,
    color: ColorUtils.darkBlue,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font13BlueSemiBold = TextStyle(
    fontSize: 13.sp,
    color: ColorUtils.primary,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font13DarkBlueMedium = TextStyle(
    fontSize: 13.sp,
    color: ColorUtils.darkBlue,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font15DarkBlueMedium = TextStyle(
    fontSize: 15.sp,
    color: ColorUtils.darkBlue,
    fontWeight: FontWeightHelper.medium,
  );
  
  static TextStyle font14BlueSemiBold = TextStyle(
    fontSize: 14.sp,
    color: ColorUtils.primary,
    fontWeight: FontWeightHelper.semiBold,
  );
}
