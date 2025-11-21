import 'dart:async';

import 'package:doit_app/ui/di/di.dart';
import 'package:doit_app/ui/splash/contract/effect/splash_effect.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashViewModel extends Notifier<void> {
  final _effectController = StreamController<SplashEffect>.broadcast();

  Stream<SplashEffect> get effect => _effectController.stream;

  @override
  FutureOr<void> build() async {
    ref.onDispose(() {
      _effectController.close();
    });
    await initializeApp();
  }

  Future<void> initializeApp() async {
    final repository = await ref.read(dbRepositoryProvider.future);
    await repository.carryOverTodos();
    await Future.delayed(Duration(seconds: 1));
    _effectController.add(NavigateToHome());
  }
}
