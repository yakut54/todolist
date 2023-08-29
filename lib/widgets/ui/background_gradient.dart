import 'package:flutter/material.dart';
import 'package:todolist/theme/constants.dart';

const backgroundGradient = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      GeneralColors.darkTurquoise,
      GeneralColors.grayblue,
      GeneralColors.grayblue,
      GeneralColors.darkTurquoise,
    ],
    stops: [0.0, 0.2, 0.8, 1.0],
  ),
);
