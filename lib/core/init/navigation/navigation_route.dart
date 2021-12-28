import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../view/authenticate/splash/view/splash_view.dart';
import '../../../view/home/details_view/view/details_view.dart';
import '../../../view/home/home_view/view/home_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.SPLASH:
        return normalNavigate(SplashView());

      case NavigationConstants.HOME:
        return normalNavigate(HomeView());

      case NavigationConstants.DETAILS:
        return normalNavigate(DetailsView());

      default:
        return normalNavigate(SplashView());
    }
  }

  MaterialPageRoute normalNavigate(
    Widget widget,
  ) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
