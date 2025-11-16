import 'package:doit_app/ui/home/contract/state/todo.dart';

abstract class DBRepository {
  Future<List<TodoModel>> getTodos();

  Future<void> insertTodo(TodoModel todo);

  Future<void> deleteTodo(TodoModel todo);

  Future<void> updateTodo(TodoModel todo);
}
