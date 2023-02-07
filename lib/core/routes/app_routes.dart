import 'package:amazon_clone/auth/pages/auth_page.dart';
import 'package:amazon_clone/home/pages/home_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(
  RouteSettings routeSettings,
) {
  switch (routeSettings.name) {
    case AuthPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthPage(),
      );
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomePage(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const SafeArea(
          child: Scaffold(
            body: Center(
              child: Text(
                "Wrong Route",
              ),
            ),
          ),
        ),
      );
  }
}
