import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'todoDatabase.db';
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            imageUrl TEXT,
            content TEXT NOT NULL,
            dateTime TEXT NOT NULL,
            isDone INTEGER NOT NULL DEFAULT 0,
            isTBD INTEGER NOT NULL DEFAULT 0
          )
        ''');
      },
    );
  }
}
