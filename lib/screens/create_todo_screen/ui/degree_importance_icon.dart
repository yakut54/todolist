import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/todo_bloc.dart';
import '/theme/constants.dart';

class DegreeImportanceIconWidget extends StatefulWidget {
  const DegreeImportanceIconWidget({super.key});

  @override
  State<DegreeImportanceIconWidget> createState() =>
      _DegreeImportanceIconWidgetState();
}

class _DegreeImportanceIconWidgetState
    extends State<DegreeImportanceIconWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            alignment: Alignment.center,
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                  color: (state.editableTodo?.importance == 'green')
                      ? GeneralColors.green
                      : (state.editableTodo?.importance == 'blue')
                          ? GeneralColors.orangePeach
                          : GeneralColors.violet),
              color: (state.editableTodo?.importance == 'green')
                  ? GeneralColors.platinum
                  : (state.editableTodo?.importance == 'blue')
                      ? GeneralColors.blue
                      : GeneralColors.orangePeach,
            ),
            child: Icon(
              (state.editableTodo?.importance == 'green')
                  ? Icons.looks_3
                  : (state.editableTodo?.importance == 'blue')
                      ? Icons.looks_two
                      : Icons.looks_one,
              size: 60,
              color: (state.editableTodo?.importance == 'green')
                  ? GeneralColors.green
                  : (state.editableTodo?.importance == 'blue')
                      ? GeneralColors.platinum
                      : GeneralColors.violet,
            ),
          ),
        );
      },
    );
  }
}
