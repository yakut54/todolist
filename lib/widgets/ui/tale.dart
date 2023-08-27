import 'package:flutter/material.dart';

class TaleBtn extends StatelessWidget {
  const TaleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 22;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 5.0, right: 10.0, bottom: 5.0, left: 10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Text(
        'Some Text',
        style: TextStyle(
            color: Colors.yellow, fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}
