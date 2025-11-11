import 'package:doit_app/ui/home/contract/state/todo.dart';

sealed class HomeEvent {}

class OnClickAddTodo extends HomeEvent {}

class ReloadData extends HomeEvent {}

class RemoveTodo extends HomeEvent {
  final TodoModel todo;

  RemoveTodo(this.todo);
}
