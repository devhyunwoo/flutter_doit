import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatasource {
  final Database db;

  LocalDatasource(this.db);

  static const tableName = 'todos';

  Future<List<TodoModel>> getTodos() async {
    final todosInMap = await db.query(tableName);
    return todosInMap.map(TodoModel.fromJson).toList();
  }

  Future<void> insertTodo(TodoModel todo) async {
    final todoInMap = todo.toJson();
    await db.insert(tableName, todoInMap);
  }

  Future<void> deleteTodo(TodoModel todo) async {
    await db.delete(tableName, where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<void> updateTodo(TodoModel todo) async {
    final todoInMap = todo.toJson();
    await db.update(
      tableName,
      todoInMap,
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}
