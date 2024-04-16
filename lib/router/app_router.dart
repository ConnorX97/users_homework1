import 'package:flutter/material.dart';
import 'package:homework_users/router/app_routes.dart';
import 'package:homework_users/views/home_view.dart';
import 'package:homework_users/views/second_view.dart';

abstract final class AppRouter {
  static String get initalRoute => AppRoutes.home;
  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.home: (context) => const HomeView(),
        AppRoutes.info: (context) => const SeconView(),
      };
}
