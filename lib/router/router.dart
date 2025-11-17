import 'package:doit_app/ui/home/view/home_view.dart';
import 'package:doit_app/ui/splash/view/splash_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashView()),
      GoRoute(path: '/home', builder: (context, state) => const HomeView()),
    ],
  );
});
