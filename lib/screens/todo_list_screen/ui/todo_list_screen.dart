import 'package:flutter/material.dart';
import 'package:todolist/db/db.dart';
import 'package:todolist/db/todo_model.dart';
import 'package:todolist/repository/local_todo_repo.dart';
import 'package:todolist/screens/todo_list_screen/index.dart';
import 'package:todolist/theme/constants.dart';
import 'package:todolist/widgets/index.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo>? _todoList;

  @override
  void initState() {
    _loadDB();
    super.initState();
  }

  _loadDB() async {
    _todoList = await TodoLocalRepository().getListTodoRepo<Todo>();
    print('length list equal ${_todoList?.length} popugaev');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient,
      child: Scaffold(
        appBar: const AppBarListScreen(),
        body: (_todoList == null)
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                backgroundColor: Colors.white,
                strokeWidth: 10,
              )
            : (_todoList!.isEmpty)
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cписок дел пуст',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _todoList?.length,
                    itemBuilder: (context, idx) {
                      return TaleBtn(
                        todo: _todoList![idx],
                      );
                    },
                  ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () async {
                await TodoLocalRepository().deleteAllTodoRepo();
                _loadDB();
              },
              heroTag: '1',
              child: const Icon(Icons.delete_forever),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                await TodoLocalRepository().deleteTodoRepo(1);
                _loadDB();
              },
              heroTag: '2',
              child: const Icon(Icons.delete),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                final todos = await TodoLocalRepository().getListTodoRepo();
                _loadDB();
                print('todos');
                print(todos);
              },
              heroTag: '3',
              child: const Icon(Icons.read_more),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                await TodoLocalRepository().insertTodoRepo();
                _loadDB();
              },
              heroTag: '4',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                await TodoLocalRepository().updateTodoRepo();
                _loadDB();
              },
              heroTag: '5',
              child: const Icon(Icons.update),
            ),
          ],
        ),
      ),
    );
  }
}
