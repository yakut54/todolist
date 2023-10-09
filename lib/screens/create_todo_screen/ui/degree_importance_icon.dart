import 'package:flutter/material.dart';
import '/theme/constants.dart';

class DegreeImportanceIconWidget extends StatefulWidget {
  final String color;
  const DegreeImportanceIconWidget({super.key, required this.color});

  @override
  State<DegreeImportanceIconWidget> createState() =>
      _DegreeImportanceIconWidgetState();
}

class _DegreeImportanceIconWidgetState
    extends State<DegreeImportanceIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        alignment: Alignment.center,
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
              color: (widget.color == 'green')
                  ? GeneralColors.green
                  : (widget.color == 'blue')
                      ? GeneralColors.orangePeach
                      : GeneralColors.violet),
          color: (widget.color == 'green')
              ? GeneralColors.platinum
              : (widget.color == 'blue')
                  ? GeneralColors.blue
                  : GeneralColors.orangePeach,
        ),
        child: Icon(
          (widget.color == 'green')
              ? Icons.looks_3
              : (widget.color == 'blue')
                  ? Icons.looks_two
                  : Icons.looks_one,
          size: 60,
          color: (widget.color == 'green')
              ? GeneralColors.green
              : (widget.color == 'blue')
                  ? GeneralColors.platinum
                  : GeneralColors.violet,
        ),
      ),
    );
  }
}
