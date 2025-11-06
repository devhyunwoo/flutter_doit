import 'dart:async';

import 'package:doit_app/ui/home/contract/effect/home_effect.dart';
import 'package:doit_app/ui/home/contract/state/home_state.dart';
import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../contract/event/home_event.dart';

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  HomeViewModel.new,
);

class HomeViewModel extends Notifier<HomeState> {
  final _effectController = StreamController<HomeEffect>.broadcast();

  Stream<HomeEffect> get effect => _effectController.stream;

  @override
  HomeState build() {
    ref.onDispose(() {
      _effectController.close();
    });
    return HomeState(items: <TodoModel>[]);
  }

  void addTodo(TodoModel todo) {
    state = state.copyWith(items: [...state.items, todo]);
  }

  void removeTodo(TodoModel todo) {
    state = state.copyWith(
      items: state.items.where((item) => item.id != todo.id).toList(),
    );
  }

  void toggleDoneButton(TodoModel todo) {
    state = state.copyWith(
      items: state.items
          .map(
            (item) =>
                item.id == todo.id ? item.copyWith(isDone: !item.isDone) : item,
          )
          .toList(),
    );
  }

  void setEvent(HomeEvent event) {
    switch (event) {
      case OnClickAddTodo():
        {
          _effectController.add(ShowBottomSheet());
        }
    }
  }
}
