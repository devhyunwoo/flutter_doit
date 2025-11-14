import 'dart:async';

import 'package:doit_app/ui/di/di.dart';
import 'package:doit_app/ui/home/contract/effect/home_effect.dart';
import 'package:doit_app/ui/home/contract/state/home_state.dart';
import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../contract/event/home_event.dart';

class HomeViewModel extends AsyncNotifier<HomeState> {
  final _effectController = StreamController<HomeEffect>.broadcast();

  Stream<HomeEffect> get effect => _effectController.stream;

  @override
  Future<HomeState> build() async {
    ref.onDispose(() {
      _effectController.close();
    });

    final repository = await ref.read(dbRepositoryProvider.future);
    final todos = await repository.getTodos();
    return HomeState(items: todos);
  }

  Future<void> _fetchDataFromDB() async {
    final repository = await ref.read(dbRepositoryProvider.future);
    final todos = await repository.getTodos();
    state = AsyncValue.data(HomeState(items: todos));
  }

  void toggleDoneButton(TodoModel todo) {
    final currentList = state.value;

    if (currentList != null) {
      final updatedList = currentList.items
          .map(
            (item) => item.id == todo.id
                ? item.copyWith(isDone: item.isDone == 0 ? 1 : 0)
                : item,
          )
          .toList();
      state = AsyncValue.data(HomeState(items: updatedList));
    }
  }

  Future<void> _removeTodo(TodoModel todo) async {
    final repository = await ref.read(dbRepositoryProvider.future);
    await repository.deleteTodo(todo);
  }

  Future<void> setEvent(HomeEvent event) async {
    switch (event) {
      case OnClickAddTodo():
        _effectController.add(ShowBottomSheet());
      case ReloadData():
        {
          state = const AsyncLoading();
          await _fetchDataFromDB();
        }
      case RemoveTodo():
        {
          await _removeTodo(event.todo);
        }
      case OnClickImage():
        _effectController.add(ShowDialog());
    }
  }
}
