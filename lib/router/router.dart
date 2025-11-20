import 'package:doit_app/ui/home/view/home_view.dart';
import 'package:doit_app/ui/month/view/month_view.dart';
import 'package:doit_app/ui/splash/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ui/bottom_nav/view/bottom_nav_layout.dart';

final _navigationKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    navigatorKey: _navigationKey,
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashView()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return BottomNavLayout(child: child);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomeView()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/month',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: MonthView()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
