import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/todo_bloc/todo_bloc.dart';
import '/theme/constants.dart';

class TextFieldWidget extends StatefulWidget {
  // final String status;

  const TextFieldWidget({
    super.key,
    // required this.status,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('widget.status >>> ${widget.status}');

    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        // if (widget.status == 'create') {}

        _controller.text = state.editableTodo!.title;

        return Container(
          margin:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          child: TextField(
            style: const TextStyle(
              fontSize: 22,
              fontFamily: FontFamily.regularFont,
              color: GeneralColors.platinum,
            ),
            maxLines: 3,
            minLines: 1,
            controller: _controller,
            onChanged: (value) {
              print(state.editableTodo?.title);
            },
            cursorColor: GeneralColors.orangePeach,
            decoration: InputDecoration(
              labelText: 'Enter Todo',
              // Set border for enabled state (default)
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: GeneralColors.orangePeach),
                borderRadius: BorderRadius.circular(5),
              ),
              // Set border for focused state
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: GeneralColors.orangePeach),
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: "...",
              fillColor: Colors.white12,
              filled: true,
              hintStyle: const TextStyle(
                fontFamily: FontFamily.regularFont,
                fontSize: 22,
                color: GeneralColors.platinum,
              ),
              labelStyle: const TextStyle(
                fontSize: 22,
                color: GeneralColors.platinum,
              ),
            ),
          ),
        );
      },
    );
  }
}
