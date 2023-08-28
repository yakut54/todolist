import 'package:flutter/cupertino.dart';
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
      margin: const EdgeInsets.only(
        top: 5.0,
        right: 10.0,
        bottom: 5.0,
        left: 10.0,
      ),
      decoration: BoxDecoration(
        color: GeneralColors.platinum,
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            Container(
              width: 4,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                color: Color.fromARGB(255, 76, 54, 244),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 45,
                  child: checkbox,
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    height: 35,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Title Todo',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Short Descriptions Todo...',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            // width: 35,
                            // height: 35,
                            decoration: BoxDecoration(
                              color: GeneralColors.darkTurquoise,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 1,
                                color: GeneralColors.orangePeach,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                CupertinoIcons.pencil,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // width: 35,
                            // height: 35,
                            decoration: BoxDecoration(
                              color: GeneralColors.darkTurquoise,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 1,
                                color: GeneralColors.orangePeach,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                CupertinoIcons.delete,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
