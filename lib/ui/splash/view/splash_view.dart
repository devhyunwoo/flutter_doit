import 'package:doit_app/ui/di/di.dart';
import 'package:doit_app/ui/splash/contract/effect/splash_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    ref.read(splashViewModelProvider.notifier).effect.listen((effect) async {
      switch (effect) {
        case NavigateToHome():
          context.pushReplacement('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('DoIt App')));
  }
}
