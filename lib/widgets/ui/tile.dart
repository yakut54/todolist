import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/theme/constants.dart';
import 'package:todolist/widgets/ui/checkbox.dart';

class TaleBtn extends StatefulWidget {
  const TaleBtn({super.key});

  @override
  State<TaleBtn> createState() => _TaleBtnState();
}

class _TaleBtnState extends State<TaleBtn> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 22;
    final theme = Theme.of(context);

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.only(right: 5),
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 45,
                  child: CheckboxWidget(),
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/single');
                },
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
            ),
            SizedBox(
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: TileIcons.size,
                    height: TileIcons.size,
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
                        color: GeneralColors.orangePeach,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                    ),
                    width: TileIcons.size,
                    height: TileIcons.size,
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
                        color: GeneralColors.orangePeach,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
