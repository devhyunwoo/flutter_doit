import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomSheetProvider =
    NotifierProvider.autoDispose<BottomSheetNotifier, TodoModel>(
      BottomSheetNotifier.new,
    );

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
}
