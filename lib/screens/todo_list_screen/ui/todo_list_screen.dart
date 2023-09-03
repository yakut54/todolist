import 'package:flutter/material.dart';
import 'package:todolist/db/db.dart';
import 'package:todolist/db/todo_model.dart';
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
    _todoList = await LDB().getTodos();
    print(_todoList?[0]);
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
            : ListView.builder(
                itemCount: _todoList?.length,
                itemBuilder: (context, idx) {
                  return TaleBtn(todo: _todoList![idx],);
                },
              ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () async {
                await LDB().deleteAllTodo();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.delete_forever),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                await LDB().deleteTodo(1);
              },
              tooltip: 'Increment',
              child: const Icon(Icons.delete),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                final todos = await LDB().getTodos();

                print('todos');
                print(todos);
              },
              tooltip: 'Increment',
              child: const Icon(Icons.read_more),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                await LDB().insertTodo(
                  const Todo(
                      isDone: 0,
                      name: 'rrr2',
                      begin: 122345,
                      deadline: 32323233223,
                      importance: 'green'),
                );
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                await LDB().updateTodo(
                  const Todo(
                      id: 2,
                      isDone: 1,
                      name: 'Юличка - Вонючечка 😘',
                      begin: 122345,
                      deadline: 32323233223,
                      importance: 'blue'),
                );
              },
              child: const Icon(Icons.update),
            ),
          ],
        ),
      ),
    );
  }
}

// (_todoList == null)
// ? const CircularProgressIndicator(
// valueColor: AlwaysStoppedAnimation(Colors.blue),
// backgroundColor: Colors.white,
// strokeWidth: 10,
// )
//     : ListView.builder(
// itemCount: 2,
// itemBuilder: (context, i) {
// return const TaleBtn();
// },
// ),
