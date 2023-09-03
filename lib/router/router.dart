import 'package:todolist/screens/single_todo_screen/index.dart';
import 'package:todolist/screens/todo_list_screen/index.dart';
import 'package:todolist/screens/create_todo_screen/index.dart';

final routes = {
  '/': (context) => const TodoListScreen(),
  '/single': (context) => const SingleTodoScreen(),
  '/create': (context) => const CreateTodoScreen(),
};
