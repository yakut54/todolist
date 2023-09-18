import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/theme/constants.dart';

import '/bloc/todo_bloc.dart';
import '/widgets/index.dart';
import '/screens/todo_list_screen/index.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient,
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          context.read<TodoBloc>().add(LoadAllTodosEvent());

          return Scaffold(
            appBar: const AppBarListScreen(),
            body: (state.allTodos.isNotEmpty)
                ? ListView.builder(
                    itemCount: state.allTodos.length,
                    itemBuilder: (context, idx) {
                      return TileBtn(todo: state.allTodos[idx]);
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '''Все задачи выполнены. Добавить задачу?''',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26,
                              color: GeneralColors.orangePeach,
                              fontFamily: FontFamily.regularFont),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/create');
                          },
                          child: Image.asset(
                            'images/ok2.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
            // floatingActionButton: Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     FloatingActionButton(
            //       onPressed: () async {
            //         context.read<TodoBloc>().add(LoadAllTodosEvent());
            //       },
            //       heroTag: '1',
            //       child: const Icon(Icons.redo_sharp),
            //     ),
            //     const SizedBox(height: 10),
            //     FloatingActionButton(
            //       onPressed: () async {
            //         var todo = Todo(
            //           deadline: 1704039803000,
            //           title: 'title 2',
            //           importance: 'blue',
            //         );

            //         context.read<TodoBloc>().add(AddTodoEvent(todo: todo));
            //       },
            //       heroTag: '2',
            //       child: const Icon(Icons.add),
            //     ),
            //     const SizedBox(height: 10),
            //     FloatingActionButton(
            //       onPressed: () async {
            //         context.read<TodoBloc>().add(DeleteAllTodosEvent());
            //       },
            //       heroTag: '3',
            //       child: const Icon(Icons.remove),
            //     ),
            //     const SizedBox(height: 10),
            //   ],
            // ),
          );
        },
      ),
    );
  }
}
