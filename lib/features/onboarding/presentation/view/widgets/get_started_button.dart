import 'package:docdoc/core/extensions/navigation.dart';
import 'package:docdoc/core/router/route_paths.dart';
import 'package:docdoc/core/themes/colors.dart';
import 'package:docdoc/core/themes/styles.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorUtils.primary,
        minimumSize: const Size(double.infinity, 55),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: () {
        context.pushNamed(RoutePaths.loginScreen);
      },
      child: Text(
        "Get Started",
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
