import 'package:flutter/material.dart';
import '/theme/constants.dart';

class RichTextWidget extends StatelessWidget {
  final String span;
  final String bold;

  const RichTextWidget({super.key, required this.span, required this.bold});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          height: 1.4,
          fontSize: FontSize.mainFont,
          color: GeneralColors.platinum,
        ),
        children: [
          TextSpan(
            text: span,
            style: const TextStyle(
              fontFamily: FontFamily.regularFont,
            ),
          ),
          TextSpan(
            text: bold,
            style: const TextStyle(
              fontFamily: FontFamily.semiFont,
            ),
          ),
        ],
      ),
    );
  }
}
