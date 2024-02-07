import 'package:docdoc/core/routing/route_paths.dart';
import 'package:docdoc/features/login/presentation/view/login_screen.dart';
import 'package:docdoc/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocDocRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: const RouteSettings(name: RoutePaths.onboardingScreen),
        );
      case RoutePaths.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: const RouteSettings(name: RoutePaths.loginScreen),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Center(
            child: Text(
              "No route found for ${settings.name}",
              style: TextStyle(fontSize: 24.sp),
            ),
          ),
        );
    }
  }
}
