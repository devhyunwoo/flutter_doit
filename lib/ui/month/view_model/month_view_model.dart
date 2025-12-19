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
    return MonthState(groupedTodos: groupedTodos, selectedDate: now);
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
    final selectedMonth =
        state.value?.selectedDate.month ?? DateTime.now().month;
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
          final currentDate = state.value?.selectedDate ?? DateTime.now();
          final previousDate = DateTime(
            currentDate.year,
            currentDate.month - 1,
            currentDate.day,
          );
          updateCalendar(previousDate);
        }

      case OnClickNextMonth():
        {
          final currentDate = state.value?.selectedDate ?? DateTime.now();
          final nextDate = DateTime(
            currentDate.year,
            currentDate.month + 1,
            currentDate.day,
          );
          updateCalendar(nextDate);
        }
      case OnSelectedDate():
        {
          updateCalendar(event.selectedDate);
        }
    }
  }

  Future<void> updateCalendar(DateTime selectedDate) async {
    final db = await ref.read(dbRepositoryProvider.future);
    final todos = await db.getTodos(selectedDate);
    state = AsyncValue.data(
      state.value!.copyWith(groupedTodos: groupByDate(todos), selectedDate: selectedDate),
    );
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
