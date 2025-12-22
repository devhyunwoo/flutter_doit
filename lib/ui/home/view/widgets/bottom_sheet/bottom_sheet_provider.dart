import 'package:doit_app/ui/di/di.dart';
import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomSheetNotifier extends AutoDisposeNotifier<TodoModel> {
  @override
  TodoModel build() {
    final selectedDate =
        ref.watch(homeViewModelProvider).value?.selectedTime ?? DateTime.now();
    return TodoModel(id: 0, content: '', dateTime: selectedDate);
  }

  void setDateTime(DateTime dateTime) {
    state = state.copyWith(dateTime: dateTime);
  }

  void setContent(String content) {
    state = state.copyWith(content: content);
  }

  void setTbd(int isTbd) {
    state = state.copyWith(isTBD: isTbd);
  }

  void setTodo(TodoModel todo) {
    state = todo;
  }

  Future<void> addTodo(bool isUpdate) async {
    final repository = await ref.watch(dbRepositoryProvider.future);
    final content = state.content;
    final dateTime = state.dateTime;
    final isTBD = state.isTBD;
    final todo = state.copyWith(
      content: content,
      dateTime: dateTime,
      isTBD: isTBD,
    );
    return isUpdate
        ? await repository.updateTodo(todo)
        : await repository.insertTodo(TodoModel(content: content, dateTime: dateTime, isTBD: isTBD));
  }
}
