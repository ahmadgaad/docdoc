import 'package:docdoc/core/extensions/navigation.dart';
import 'package:docdoc/core/router/route_paths.dart';
import 'package:docdoc/core/themes/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account yet? ',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: 'Sign Up ',
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(RoutePaths.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}
