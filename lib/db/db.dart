import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'todo_model.dart';

const db_name = 'todos';

class LDB {
  Database? _database;

  Future get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('todos_database3.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $db_name(
      id INTEGER PRIMARY KEY,
      name TEXT, 
      isDone INTEGER,
      begin INTEGER,
      deadline INTEGER,
      importance TEXT
    )
    ''');
  }

  Future<List<Todo>> getTodos() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Todos.
    final List<Map<String, dynamic>> maps = await db.query(db_name);

    // Convert the List<Map<String, dynamic> into a List<Todo>.
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        name: maps[i]['name'],
        isDone: maps[i]['isDone'],
        begin: maps[i]['begin'],
        deadline: maps[i]['deadline'],
        importance: maps[i]['importance'],
      );
    });
  }

  Future<void> insertTodo(Todo todo) async {
    final db = await database;

    await db.insert(
      db_name,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print('Готово, хозяин! insertTodo');
  }

  Future<void> updateTodo(Todo todo) async {
    final db = await database;

    await db.update(
      db_name,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );

    print('update');
  }

  Future<void> deleteTodo(int id) async {
    final db = await database;

    await db.delete(
      db_name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllTodo() async {
    final db = await database;

    await db.delete(db_name);
  }
}
