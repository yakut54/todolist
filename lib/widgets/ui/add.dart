import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';

class AddBtn extends StatelessWidget {
  const AddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(
          top: 10.0, right: 10.0, bottom: 5.0, left: 10.0),
      decoration: BoxDecoration(
        color: colorsMap['color_2'],
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: colorsMap['color_4']!,
          width: 1
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          color: colorsMap['color_4'],
          Icons.add, size: 30,)
      ),
    );
  }
}
