import '../state/todo.dart';

sealed class HomeEffect {}

class ShowBottomSheet extends HomeEffect {
  final TodoModel? todo;

  ShowBottomSheet({this.todo});
}

class ShowDialog extends HomeEffect {
  final TodoModel todo;

  ShowDialog(this.todo);
}
