import 'package:docdoc/core/observers/router_observer.dart';
import 'package:docdoc/core/router/docdoc_router.dart';
import 'package:docdoc/core/router/route_paths.dart';
import 'package:docdoc/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocDocApp extends StatelessWidget {
  const DocDocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorUtils.primary,
          scaffoldBackgroundColor: Colors.white,
        ),
        title: "Doc Doc",
        navigatorObservers: [RouterObserver()],
        initialRoute: RoutePaths.onboardingScreen,
        onGenerateRoute: DocDocRouter.generateRoute,
      ),
    );
  }
}
