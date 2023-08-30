import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todolist/theme/constants.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RoundCheckBox(
          border: Border.all(
            width: 1,
            color: const Color.fromARGB(0, 17, 101, 102),
          ),
          onTap: (selected) {
            print('RoundCheckBox');
          },
          uncheckedWidget: const Icon(
            Icons.alarm,
            color: GeneralColors.darkTurquoise,
            size: 25,
          ),
          isChecked: false,
          size: 30,
          checkedWidget: const Icon(
            Icons.check,
            color: GeneralColors.orangePeach,
            size: 20,
          ),
          checkedColor: GeneralColors.darkTurquoise,
          animationDuration: const Duration(
            milliseconds: 200,
          ),
        ),
      ],
    );
  }
}
