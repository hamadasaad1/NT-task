import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/question/presentation/pages/question_screen.dart';
import 'package:template/features/travel/presentation/pages/travel_screen.dart';

import '../../app/service_locator.dart';
import '../../features/auth/presentation/view/login_screen.dart';
import '../../features/home/presentation/view/home_screen.dart';
import '../../features/splash/splash_view.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = '/';

  static const String loginRoute = '/login';

  static const String kdsHomeRoute = '/kdsHomeRoute';
  static const String travelRoute = '/travelRoute';
  static const String questionRoute = '/questionRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());

      case Routes.loginRoute:
        initAuthModule();
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.kdsHomeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.travelRoute:
        initTravelModule();
        return MaterialPageRoute(builder: (_) => const TravelScreen());
      case Routes.questionRoute:
        initQuestionModule();
        return MaterialPageRoute(
            builder: (_) => const ProviderScope(child: QuestionScreen()));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
