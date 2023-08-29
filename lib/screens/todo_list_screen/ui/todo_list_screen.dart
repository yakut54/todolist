import 'package:flutter/material.dart';
import 'package:todolist/screens/todo_list_screen/index.dart';
import 'package:todolist/widgets/index.dart';

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
      child: Scaffold(
        appBar: appBar,
        body: Center(
          child: ListView.builder(
            itemCount: 2,
            padding: const EdgeInsets.only(top: 10),
            itemBuilder: (context, i) {
              return const TaleBtn();
            },
          ),
        ),
      ),
    );
  }
}
