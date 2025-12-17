import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatasource {
  final Database db;

  LocalDatasource(this.db);

  static const tableName = 'todos';

  Future<List<TodoModel>> getTodos(DateTime date) async {
    final todayStart = DateTime(date.year, date.month, date.day);
    final todayEnd = todayStart.add(Duration(days: 1));
    final todosInMap = await db.query(
      tableName,
      where: 'dateTime >= ? AND dateTime < ?',
      whereArgs: [todayStart.toIso8601String(), todayEnd.toIso8601String()],
      orderBy: 'dateTime ASC',
    );
    return todosInMap.map(TodoModel.fromJson).toList();
  }

  Future<void> carryOverDodos() async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final overdueTodoInMap = await db.query(
      tableName,
      where: 'dateTime < ? AND isDone = ?',
      whereArgs: [todayStart.toIso8601String(), 0],
    );
    final overdueTodos = overdueTodoInMap.map(TodoModel.fromJson).toList();
    for (final todo in overdueTodos) {
      final old = todo.dateTime;
      final newTodo = todo.copyWith(
        dateTime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          old.hour,
          old.minute,
          old.second,
          old.millisecond,
          old.microsecond,
        ),
      );
      await updateTodo(newTodo);
    }
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

  Future<List<TodoModel>> getTodosByMonth(int year, int month) async {
    final monthStart = DateTime(year, month, 1);
    final monthEnd = (month < 12)
        ? DateTime(year, month + 1, 1)
        : DateTime(year + 1, 1, 1);
    final todosInMap = await db.query(
      tableName,
      where: 'dateTime >= ? AND dateTime < ?',
      whereArgs: [monthStart.toIso8601String(), monthEnd.toIso8601String()],
      orderBy: 'dateTime ASC',
    );
    return todosInMap.map(TodoModel.fromJson).toList();
  }
}
