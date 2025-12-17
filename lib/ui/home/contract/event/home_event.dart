import 'package:doit_app/ui/home/contract/state/todo.dart';

sealed class HomeEvent {}

class OnClickAddTodo extends HomeEvent {}

class ReloadData extends HomeEvent {}

class RemoveTodo extends HomeEvent {
  final TodoModel todo;

  RemoveTodo(this.todo);
}

class OnClickImage extends HomeEvent {
  final TodoModel todo;

  OnClickImage(this.todo);
}

class UpdateTodo extends HomeEvent {
  final TodoModel todo;
  final String imageUrl;

  UpdateTodo(this.todo, this.imageUrl);
}

class OnClickNextDay extends HomeEvent {}

class OnClickPrevDay extends HomeEvent {}
