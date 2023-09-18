import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '/db/todo_model.dart';

const dbName = 'todos';

class LDB {
  Database? _database;

  Future get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('todos_database4.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $dbName(
      id INTEGER PRIMARY KEY,
      isDone INTEGER,
      isDeleted INTEGER,
      begin INTEGER,
      deadline INTEGER,
      title TEXT, 
      importance TEXT
    )
    ''');
  }

  Future<List<Todo>> getTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(dbName);

    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        isDone: maps[i]['isDone'],
        isDeleted: maps[i]['isDeleted'],
        begin: maps[i]['begin'],
        deadline: maps[i]['deadline'],
        title: maps[i]['title'],
        importance: maps[i]['importance'],
      );
    });
  }

  Future<void> insertTodo(Todo todo) async {
    final db = await database;

    print(todo);

    await db.insert(
      dbName,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print(db);
  }

  Future<void> updateTodo(Todo todo) async {
    final db = await database;

    await db.update(
      dbName,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );

    print('update');
  }

  Future<void> deleteTodo(int id) async {
    final db = await database;

    await db.delete(
      dbName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllTodo() async {
    final db = await database;

    await db.delete(dbName);
  }
}
