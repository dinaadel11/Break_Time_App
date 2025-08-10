import 'package:go_router/go_router.dart';
import 'package:newsapp/featuer/break/break_view.dart';
import 'package:newsapp/featuer/home/home_view.dart';
import 'package:newsapp/featuer/setting/setting_view.dart';
import 'package:newsapp/featuer/splash/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplasView(),
    ),
    GoRoute(
      path: '/SettingView',
      builder: (context, state) => const SettingView(),
    ),
    GoRoute(
      path: '/HomeView',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/BreakView',
      builder: (context, state) => const BreakView(),
    ),
  ]);
}
