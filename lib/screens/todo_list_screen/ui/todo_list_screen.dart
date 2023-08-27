import 'package:flutter/material.dart';
import 'package:todolist/widgets/index.dart';
import '../../../theme/colors.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'СПИСОК ДЕЛ',
          style: TextStyle(
            fontFamily: 'akrobat_semibold',
            fontSize: 28,
            color: colorsMap['color_5'],
          ),
          textAlign: TextAlign.center,
        ),
        actions: const [AddBtn()],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorsMap['color_2']!,
              colorsMap['color_1']!,
              colorsMap['color_1']!,
              colorsMap['color_2']!,
            ],
            stops: [0.0, 0.2, 0.8, 1.0],
          ),
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            return const TaleBtn();
          },
        ),
      ),
    );
  }
}
