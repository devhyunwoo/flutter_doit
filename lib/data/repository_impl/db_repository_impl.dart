import 'package:doit_app/data/datasource/local_datasource.dart';
import 'package:doit_app/data/repository/db_repository.dart';
import 'package:doit_app/ui/home/contract/state/todo.dart';

class DBRepositoryImpl extends DBRepository {
  final LocalDatasource localDatasource;

  DBRepositoryImpl(this.localDatasource);

  @override
  Future<List<TodoModel>> getTodos() async {
    return await localDatasource.getTodos();
  }

  @override
  Future<void> insertTodo(TodoModel todo) async {
    await localDatasource.insertTodo(todo);
  }

  @override
  Future<void> deleteTodo(TodoModel todo) async {
    await localDatasource.deleteTodo(todo);
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    await localDatasource.updateTodo(todo);
  }

  @override
  Future<void> carryOverTodos() async {
    await localDatasource.carryOverDodos();
  }
}
