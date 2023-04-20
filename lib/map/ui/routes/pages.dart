import 'package:crimityapp/map/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/request_permission/request_permission_page.dart';
import '../splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH:(_) => const SplashPage(),
    Routes.PERMISSIONS:(_) => const RequestPermissionPage(),
    Routes.HOME:(_) => const HomePage(),
  };
}