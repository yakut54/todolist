import 'package:flutter/material.dart';
import 'package:todolist/theme/constants.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color(0x00000000),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: GeneralColors.grayblue,
    titleTextStyle: TextStyle(
      fontFamily: FontFamily.semiFont,
      fontSize: FontSize.header,
      color: GeneralColors.orangePeach,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: GeneralColors.grayblue,
      fontFamily: FontFamily.semiFont,
      fontSize: FontSize.tileTitle,
    ),
    bodyMedium: TextStyle(
      color: GeneralColors.grayblue,
      fontFamily: FontFamily.regularFont,
      fontSize: FontSize.tileSubtitle,
    ),
  ),
);
