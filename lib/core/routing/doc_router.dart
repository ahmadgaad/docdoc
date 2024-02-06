import 'package:docdoc/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const Placeholder(),
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
