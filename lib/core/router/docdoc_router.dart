import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/router/route_paths.dart';
import 'package:docdoc/features/home/presentation/view/home_screen.dart';
import 'package:docdoc/features/login/presentation/controller/login_cubit.dart';
import 'package:docdoc/features/login/presentation/view/login_screen.dart';
import 'package:docdoc/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocDocRouter {
  static Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen.
    // final arguments = settings.arguments;
    switch (settings.name) {
      case RoutePaths.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: const RouteSettings(name: RoutePaths.onboardingScreen),
        );
      case RoutePaths.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
          settings: const RouteSettings(name: RoutePaths.loginScreen),
        );
      case RoutePaths.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: const RouteSettings(name: RoutePaths.homeScreen),
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
