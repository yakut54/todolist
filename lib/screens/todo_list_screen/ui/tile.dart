import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/db/db.dart';
import 'package:todolist/db/todo_model.dart';
import 'package:todolist/repository/local_todo_repo.dart';
import 'package:todolist/theme/constants.dart';
import 'package:todolist/screens/todo_list_screen/ui/checkbox.dart';

class TaleBtn extends StatelessWidget {
  final Todo todo;

  const TaleBtn({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color importanceColor;

    if (todo.importance == 'green') {
      importanceColor = GeneralColors.green;
    } else if (todo.importance == 'blue') {
      importanceColor = GeneralColors.blue;
    } else {
      importanceColor = GeneralColors.violet;
    }

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
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: importanceColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 45,
                  child:
                      CheckboxWidget(isDone: todo.isDone == 1 ? true : false),
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/single');
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          todo.name,
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
                              decorationColor: importanceColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.delete,
                        color: GeneralColors.darkTurquoise,
                        size: 25,
                      ),
                      onPressed: () async {
                        await TodoLocalRepository().deleteTodoRepo(todo.id!);
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
  }
}
