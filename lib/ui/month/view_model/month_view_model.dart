import 'dart:async';

import 'package:doit_app/ui/di/di.dart';
import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:doit_app/ui/month/contract/event/month_event.dart';
import 'package:doit_app/ui/month/contract/state/month_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthViewModel extends AsyncNotifier<MonthState> {
  @override
  FutureOr<MonthState> build() async {
    final now = DateTime.now();
    final groupedTodos = await fetchTodosByMonth(now.year, now.month);
    return MonthState(groupedTodos: groupedTodos, selectedMonth: now.month);
  }

  Future<Map<DateTime, List<TodoModel>>> fetchTodosByMonth(
    int year,
    int month,
  ) async {
    final repository = await ref.read(dbRepositoryProvider.future);
    final todos = await repository.getTodosByMonth(year, month);
    return groupByDate(todos);
  }

  Future<void> reload() async {
    final selectedMonth = state.value?.selectedMonth ?? DateTime.now().month;
    final groupedTodos = await fetchTodosByMonth(
      DateTime.now().year,
      selectedMonth,
    );
    state = AsyncValue.data(state.value!.copyWith(groupedTodos: groupedTodos));
  }

  Future<void> setEvent(MonthEvent event) async {
    switch (event) {
      case OnClickPreviousMonth():
        {
          final currentMonth =
              state.value?.selectedMonth ?? DateTime.now().month;
          final previousMonth = currentMonth == 1 ? 12 : currentMonth - 1;
          state = AsyncValue.data(
            state.value!.copyWith(selectedMonth: previousMonth),
          );
          final groupedTodos = await fetchTodosByMonth(
            DateTime.now().year,
            previousMonth,
          );
          state = AsyncValue.data(
            state.value!.copyWith(groupedTodos: groupedTodos),
          );
        }

      case OnClickNextMonth():
        {
          final currentMonth =
              state.value?.selectedMonth ?? DateTime.now().month;
          final nextMonth = currentMonth == 12 ? 1 : currentMonth + 1;
          state = AsyncValue.data(
            state.value!.copyWith(selectedMonth: nextMonth),
          );
          final groupedTodos = await fetchTodosByMonth(
            DateTime.now().year,
            nextMonth,
          );
          state = AsyncValue.data(
            state.value!.copyWith(groupedTodos: groupedTodos),
          );
        }
    }
  }

  Map<DateTime, List<TodoModel>> groupByDate(List<TodoModel> todos) {
    Map<DateTime, List<TodoModel>> grouped = {};
    for (var todo in todos) {
      final date = DateTime(
        todo.dateTime.year,
        todo.dateTime.month,
        todo.dateTime.day,
      );
      grouped.putIfAbsent(date, () => []).add(todo);
    }
    return grouped;
  }
}
