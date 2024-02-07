import 'package:docdoc/core/utils/colored_logs.dart';
import 'package:flutter/material.dart';

class RouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute && previousRoute is PageRoute) {
      infoLog(
          'Navigated to ${route.settings.name} from ${previousRoute.settings.name}');
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute && oldRoute is PageRoute) {
      infoLog(
          'Replaced ${oldRoute.settings.name} with ${newRoute.settings.name}');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (route is PageRoute && previousRoute is PageRoute) {
      infoLog(
          'Popped ${route.settings.name} to ${previousRoute.settings.name}');
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    if (route is PageRoute) {
      infoLog('Removed ${route.settings.name}');
    }
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    if (route is PageRoute) {
      infoLog('Started user gesture on ${route.settings.name}');
    }
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    infoLog('Stopped user gesture');
  }
}
