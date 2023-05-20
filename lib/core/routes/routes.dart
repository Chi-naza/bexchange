import 'package:bexchange/views/interstitial_ad_screen.dart';
import 'package:bexchange/views/splash_screen.dart';

import '../../views/coin.dart';
import '../../views/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static const home = "/home";
  static const coinDetails = "/coin/details";
  static const splashScreen = "/";
  static const interstitialAdScreen = "/interstitial/ad/screen";
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
      case Routes.interstitialAdScreen:
        return MaterialPageRoute(
          builder: ((context) => const InterstitialAdScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const MySplashScreen()),
        );
    }
  }
}
