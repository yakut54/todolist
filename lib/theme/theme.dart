import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';

final theme = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: GeneralColors.grayblue),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: GeneralColors.grayblue,
      fontFamily: 'akrobat_semibold',
      fontSize: 24,
    ),
    bodyMedium: TextStyle(
      color: GeneralColors.grayblue,
      fontFamily: 'akrobat_regular',
      fontSize: 22,
    ),
  ),
);
