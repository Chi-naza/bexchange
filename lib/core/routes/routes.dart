import 'package:bexchange/views/splash_screen.dart';

import '../../views/coin.dart';
import '../../views/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static const home = "/home";
  static const coinDetails = "/coin/details";
  static const splashScreen = "/";
}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
      case Routes.coinDetails:
        return MaterialPageRoute(
          builder: ((context) => const CoinScreen()),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: ((context) => const MySplashScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
    }
  }
}
