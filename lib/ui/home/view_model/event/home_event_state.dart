import 'package:doit_app/ui/home/models/home_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeEventStateProvider = NotifierProvider<HomeEventState, HomeEvent>(
  HomeEventState.new,
);

class HomeEventState extends Notifier<HomeEvent> {
  @override
  HomeEvent build() {
    return HomeEvent(showBottomSheet: false);
  }

  void showBottomSheet() {
    state = state.copyWith(showBottomSheet: true);
  }

  void hideBottomSheet() {
    state = state.copyWith(showBottomSheet: false);
  }
}
