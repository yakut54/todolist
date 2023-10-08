// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/todo_bloc.dart';
import '/db/todo_model.dart';
import '/theme/constants.dart';
import '/screens/todo_list_screen/ui/checkbox.dart';

class TileBtn extends StatelessWidget {
  final Todo todo;

  const TileBtn({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color? importanceColor;

    if (todo.importance == 'green') {
      importanceColor = GeneralColors.green;
    } else if (todo.importance == 'blue') {
      importanceColor = GeneralColors.blue;
    } else if (todo.importance == 'violet') {
      importanceColor = GeneralColors.violet;
    }

    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(right: 5),
          decoration: const BoxDecoration(
            color: GeneralColors.platinum,
            border: Border(
              bottom: BorderSide(width: 1.5, color: GeneralColors.grayblue),
            ),
          ),
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                // Полосочка слева
                Container(
                  width: 6,
                  decoration: BoxDecoration(
                    color: importanceColor,
                  ),
                ),
                // checkbox
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 45,
                      child: CheckboxWidget(todo: todo),
                    ),
                  ],
                ),
                // action
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      context
                          .read<TodoBloc>()
                          .add(CreateEditableTodoEvent(todo: todo));
                      Navigator.of(context).pushNamed('/single');
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              todo.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: FontFamily.regularFont,
                                color: GeneralColors.darkTurquoise,
                                decoration: todo.isDone == 1
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: importanceColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // bin
                SizedBox(
                  height: 70,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5, bottom: 5),
                        width: TileIcons.size,
                        height: TileIcons.size,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: BlocBuilder<TodoBloc, TodoState>(
                          builder: (context, state) {
                            return IconButton(
                              icon: const Icon(
                                CupertinoIcons.delete,
                                color: GeneralColors.darkTurquoise,
                                size: 25,
                              ),
                              onPressed: () async {
                                context
                                    .read<TodoBloc>()
                                    .add(DeleteTodoEvent(todo: todo));
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
