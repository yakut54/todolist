import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todolist/theme/constants.dart';

class CheckboxWidget extends StatelessWidget {
  final bool isDone;

  const CheckboxWidget({
    super.key,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
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
            print('RoundCheckBox');
          },
          uncheckedWidget: const Icon(
            Icons.alarm,
            color: GeneralColors.darkTurquoise,
            size: 25,
          ),
          isChecked: isDone,
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
  }
}
