import 'package:flutter/material.dart';
import '/theme/constants.dart';

class DegreeImportanceIconWidget extends StatefulWidget {
  const DegreeImportanceIconWidget({super.key});

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
          border: Border.all(color: GeneralColors.green),
          color: GeneralColors.platinum,
        ),
        child: const Icon(
          Icons.looks_3,
          size: 60,
          color: GeneralColors.green,
        ),
      ),
    );
  }
}
