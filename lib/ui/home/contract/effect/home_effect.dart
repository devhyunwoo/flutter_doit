import '../state/todo.dart';

sealed class HomeEffect {}

class ShowBottomSheet extends HomeEffect {}

class ShowDialog extends HomeEffect {
  final TodoModel todo;

  ShowDialog(this.todo);
}
