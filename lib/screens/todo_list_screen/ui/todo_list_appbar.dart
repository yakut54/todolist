import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/widgets/index.dart';

final appBar = AppBar(
  centerTitle: true,
  title: const Text(
    'СПИСОК ДЕЛ',
    style: TextStyle(
      fontFamily: 'akrobat_semibold',
      fontSize: 28,
      color: GeneralColors.orangePeach,
    ),
    textAlign: TextAlign.center,
  ),
  actions: const [AddBtn()],
);