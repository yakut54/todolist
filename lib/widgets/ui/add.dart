import 'package:flutter/material.dart';
import 'package:todolist/theme/constants.dart';

class AddBtn extends StatelessWidget {
  const AddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.only(
          top: 10.0, right: 8.0, bottom: 12.0, left: 10.0),
      decoration: BoxDecoration(
        color: GeneralColors.darkTurquoise,
        // borderRadius: BorderRadius.circular(40),
        shape: BoxShape.circle,
        border: Border.all(color: GeneralColors.orangePeach, width: 1),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Icon(
          color: GeneralColors.orangePeach,
          Icons.add,
          size: 25,
        ),
      ),
    );
  }
}
