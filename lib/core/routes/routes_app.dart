import 'package:flutter/material.dart';
import 'package:guia_motel/features/home/view/home.dart';

abstract class AppRouters {
  static const home = '/home';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouters.home:
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) =>
            HomeScreen(),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      );
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}