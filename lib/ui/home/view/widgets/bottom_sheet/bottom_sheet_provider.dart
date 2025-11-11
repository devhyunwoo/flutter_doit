import 'package:doit_app/ui/di/di.dart';
import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomSheetNotifier extends AutoDisposeNotifier<TodoModel> {
  @override
  TodoModel build() {
    return TodoModel(id: 0, title: '', content: '', dateTime: DateTime.now());
  }

  void setDateTime(DateTime dateTime) {
    state = state.copyWith(dateTime: dateTime);
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setContent(String content) {
    state = state.copyWith(content: content);
  }

  Future<void> addTodo() async {
    final title = state.title;
    final content = state.content;
    final dateTime = state.dateTime;
    final repository = await ref.watch(dbRepositoryProvider.future);
    return repository.insertTodo(
      TodoModel(title: title, content: content, dateTime: dateTime),
    );
  }
}
