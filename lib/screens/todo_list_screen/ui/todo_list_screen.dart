import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/blocs/todo_bloc/todo_bloc.dart';
import '/theme/constants.dart';

import '/db/todo_model.dart';
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
                : const _DoneWidget(),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: GeneralColors.grayblue,
                  onPressed: () async {
                    var todo = Todo(
                      deadline: 1704039803000,
                      title: 'title 4',
                      importance: 'violet',
                    );

                    context.read<TodoBloc>().add(AddTodoEvent(todo: todo));
                  },
                  heroTag: '2',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DoneWidget extends StatelessWidget {
  const _DoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
              Navigator.of(context)
                  .pushNamed('/create', arguments: {'createOrEdit': 'create'});
            },
            child: Image.asset(
              'images/ok2.png',
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
