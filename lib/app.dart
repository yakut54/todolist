import 'package:flutter/material.dart';
import 'package:todolist/theme/theme.dart';
import 'screens/todo_list_screen/index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: theme,
      home: const TodoListScreen(),
    );
  }
}

