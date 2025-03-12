import 'package:flutter/material.dart';
import 'package:name_checker_app/feature/dashboard/view/screens/dashboard_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(
      //     builder: (context) => const SplashScreen(),
      //   );
      case '/':
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
    }
    return null;
  }
}
