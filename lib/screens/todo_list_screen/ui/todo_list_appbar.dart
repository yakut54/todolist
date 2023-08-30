import 'package:flutter/material.dart';
import 'package:todolist/screens/create_todo_screen/index.dart';
import 'package:todolist/theme/constants.dart';

class AppBarListScreen extends StatelessWidget implements PreferredSizeWidget {
  const AppBarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Todo list'.toUpperCase(),
        textAlign: TextAlign.center,
      ),
      actions: [
        IconButton(
          iconSize: 35,
          color: GeneralColors.orangePeach,
          icon: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateTodoScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}