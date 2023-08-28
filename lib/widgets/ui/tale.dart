import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/widgets/ui/checkbox.dart';

class TaleBtn extends StatelessWidget {
  const TaleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 22;
    final theme = Theme.of(context);

    return Container(
      width: screenWidth,
      margin:
          const EdgeInsets.only(top: 5.0, right: 10.0, bottom: 5.0, left: 10.0),
      decoration: BoxDecoration(
        color: GeneralColors.platinum,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      child: checkbox,
                    ),
                  ],
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Title Todo',
                              style: theme.textTheme.bodyLarge),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Sort Descriptions Todo...',
                              style: theme.textTheme.bodyMedium),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 40,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 45,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 4,
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
