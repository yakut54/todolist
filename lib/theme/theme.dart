import 'package:flutter/material.dart';
import '/theme/constants.dart';

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
    bodyMedium: TextStyle(
        color: GeneralColors.grayblue,
        fontFamily: FontFamily.regularFont,
        fontSize: FontSize.tileTitle,
        height: 1.4),
  ),
);
