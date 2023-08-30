import 'package:flutter/material.dart';
import 'package:todolist/theme/constants.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

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
    return Container(
      margin: const EdgeInsets.only(
          top: 20, left: 10, right: 10, bottom: 10),
      child: TextField(
        style: const TextStyle(
          fontSize: 22,
          fontFamily: FontFamily.regularFont,
          color: GeneralColors.platinum,
        ),
        maxLines: 3,
        minLines: 1,
        controller: _controller,
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
  }
}
