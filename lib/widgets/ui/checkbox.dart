import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todolist/theme/colors.dart';

final checkbox = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    RoundCheckBox(
      border: Border.all(width: 1, color: GeneralColors.darkTurquoise),
      onTap: (selected) {
        print('RoundCheckBox');
      },
      uncheckedColor: GeneralColors.darkTurquoise,
      uncheckedWidget: const Icon(
        Icons.alarm,
        color: GeneralColors.orangePeach,
      ),
      isChecked: true,
      size: 30,
      checkedWidget: const Icon(
        Icons.check,
        color: GeneralColors.orangePeach,
      ),
      checkedColor: GeneralColors.darkTurquoise,
      animationDuration: const Duration(
        milliseconds: 200,
      ),
    ),
  ],
);
