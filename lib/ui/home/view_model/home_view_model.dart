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
    final now = DateTime.now();
    final repository = await ref.read(dbRepositoryProvider.future);
    final todos = await repository.getTodos(now);
    return HomeState(selectedTime: now, items: todos);
  }

  Future<void> _fetchDataFromDB() async {
    final repository = await ref.read(dbRepositoryProvider.future);
    final selectedTime = state.value?.selectedTime ?? DateTime.now();
    final todos = await repository.getTodos(selectedTime);
    state = AsyncValue.data(state.value!.copyWith(items: todos));
  }

  Future<void> reload() async {
    await _fetchDataFromDB();
  }

  Future<void> toggleDoneButton(TodoModel todo) async {
    final modifiedTodo = todo.copyWith(isDone: todo.isDone == 0 ? 1 : 0);
    final repository = await ref.read(dbRepositoryProvider.future);
    await repository.updateTodo(modifiedTodo);
    await _fetchDataFromDB();
    await ref.read(monthViewModelProvider.notifier).reload();
  }

  Future<void> _removeTodo(TodoModel todo) async {
    final repository = await ref.read(dbRepositoryProvider.future);
    await repository.deleteTodo(todo);
    final removedState = state.value?.items
        .where((item) => item.id != todo.id)
        .toList();
    if (removedState != null) {
      state = AsyncValue.data(state.value!.copyWith(items: removedState));
    }
  }

  Future<void> setEvent(HomeEvent event) async {
    switch (event) {
      case OnClickAddTodo():
        _effectController.add(ShowBottomSheet());
      case ReloadData():
        {
          state = const AsyncLoading();
          await _fetchDataFromDB();
          await ref.read(monthViewModelProvider.notifier).reload();
        }
      case RemoveTodo():
        {
          await _removeTodo(event.todo);
          await ref.read(monthViewModelProvider.notifier).reload();
        }
      case OnClickImage():
        _effectController.add(ShowDialog(event.todo));
      case UpdateTodo():
        {
          final repository = await ref.read(dbRepositoryProvider.future);
          await repository.updateTodo(
            event.todo.copyWith(imageUrl: event.imageUrl),
          );
          state = const AsyncLoading();
          await _fetchDataFromDB();
          await ref.read(monthViewModelProvider.notifier).reload();
        }
      case OnClickPrevDay():
        {
          state = const AsyncLoading();
          final currentDate = state.value?.selectedTime ?? DateTime.now();
          final prevDate = currentDate.subtract(const Duration(days: 1));
          final repository = await ref.read(dbRepositoryProvider.future);
          final todos = await repository.getTodos(prevDate);
          state = AsyncValue.data(
            state.value!.copyWith(selectedTime: prevDate, items: todos),
          );
        }
      case OnClickNextDay():
        state = const AsyncLoading();
        final currentDate = state.value?.selectedTime ?? DateTime.now();
        final nextDay = currentDate.add(const Duration(days: 1));
        final repository = await ref.read(dbRepositoryProvider.future);
        final todos = await repository.getTodos(nextDay);
        state = AsyncValue.data(
          state.value!.copyWith(selectedTime: nextDay, items: todos),
        );
    }
  }
}
