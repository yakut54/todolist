import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import '/db/todo_model.dart';
import '/theme/constants.dart';
import '/bloc/todo_bloc.dart';

class CheckboxWidget extends StatelessWidget {
  final Todo todo;

  const CheckboxWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RoundCheckBox(
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(0, 0, 0, 0),
              ),
              onTap: (selected) {
                context.read<TodoBloc>().add(UpdateIsDoneEvent(todo: todo));
              },
              uncheckedWidget: const Icon(
                Icons.alarm,
                color: GeneralColors.darkTurquoise,
                size: 25,
              ),
              isChecked: todo.isDone == 1 ? true : false,
              size: 30,
              checkedWidget: const Icon(
                Icons.check,
                color: GeneralColors.darkTurquoise,
                size: 25,
              ),
              checkedColor: const Color(0x00000000),
              animationDuration: const Duration(
                milliseconds: 200,
              ),
            ),
          ],
        );
      },
    );
  }
}
