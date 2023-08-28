import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color(0x00000000),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: GeneralColors.grayblue,
    titleTextStyle: TextStyle(
      fontFamily: 'akrobat_semibold',
      fontSize: 26,
      color: GeneralColors.orangePeach,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: GeneralColors.grayblue,
      fontFamily: 'akrobat_semibold',
      fontSize: 26,
    ),
    bodyMedium: TextStyle(
      color: GeneralColors.grayblue,
      fontFamily: 'akrobat_regular',
      fontSize: 20,
    ),
  ),
);
