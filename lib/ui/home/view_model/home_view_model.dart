import 'package:doit_app/ui/home/models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = NotifierProvider<HomeViewModel, List<TodoModel>>(
  HomeViewModel.new,
);

class HomeViewModel extends Notifier<List<TodoModel>> {
  @override
  List<TodoModel> build() {
    return <TodoModel>[];
  }

  void addTodo(TodoModel todo) {
    state = [...state, todo];
  }

  void removeTodo(TodoModel todo) {
    state = state.where((item) => item != todo).toList();
  }

  void toggleDoneButton(TodoModel todo) {
    state = state
        .map(
          (item) =>
              item.id == todo.id ? item.copyWith(isDone: !item.isDone) : item,
        )
        .toList();
  }
}
