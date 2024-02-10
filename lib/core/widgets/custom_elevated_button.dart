import 'package:docdoc/core/themes/colors.dart';
import 'package:docdoc/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double? borderRadius;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.buttonWidth,
    this.buttonHeight,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorUtils.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding?.w ?? 12.w,
          vertical: verticalPadding?.h ?? 14.h,
        ),
        fixedSize: Size(
          buttonWidth?.w ?? double.maxFinite,
          buttonHeight?.h ?? 52.h,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle ?? TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
