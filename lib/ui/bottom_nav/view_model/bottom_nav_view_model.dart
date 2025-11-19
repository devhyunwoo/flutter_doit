import 'dart:async';

import 'package:doit_app/ui/bottom_nav/contract/effect/bottom_nav_effect.dart';
import 'package:doit_app/ui/bottom_nav/contract/event/bottom_nav_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavViewModel extends Notifier<int> {
  final _effectController = StreamController<BottomNavEffect>.broadcast();

  Stream<BottomNavEffect> get effect => _effectController.stream;

  @override
  int build() {
    return 0;
  }

  void setEvent(BottomNavEvent event) {
    switch (event) {
      case OnTabItem():
        state = event.index;

        _effectController.add(NavigateToPage(event.index));
    }
  }
}
