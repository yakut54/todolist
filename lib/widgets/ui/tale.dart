import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';

class TaleBtn extends StatelessWidget {
  const TaleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 22;

    return Container(
      width: screenWidth,
      margin:
          const EdgeInsets.only(top: 5.0, right: 10.0, bottom: 5.0, left: 10.0),
      decoration: BoxDecoration(
        color: GeneralColors.tanColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 40,
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        decoration: BoxDecoration(color: Colors.deepPurple,border: Border.all(width: 1)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 40,
                                decoration: BoxDecoration(border: Border.all(width: 1)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 45,
                                decoration: BoxDecoration(border: Border.all(width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                        decoration: const BoxDecoration(color: Colors.green),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
