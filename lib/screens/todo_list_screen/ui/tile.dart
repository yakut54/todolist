import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/theme/constants.dart';
import 'package:todolist/screens/todo_list_screen/ui/checkbox.dart';

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
      decoration: const BoxDecoration(
        color: GeneralColors.platinum,
        border: Border(
          bottom: BorderSide(width: 1.5, color: GeneralColors.grayblue),
        ),
      ),
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            Container(
              width: 6,
              decoration: const BoxDecoration(
                color: GeneralColors.fiolet,
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
                    SizedBox(
                      height: 70,
                      child: Align(
                        alignment: Alignment.centerLeft,
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
                    margin: const EdgeInsets.only(left: 5, bottom: 5),
                    width: TileIcons.size,
                    height: TileIcons.size,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.delete,
                        color: GeneralColors.darkTurquoise,
                        size: 25,
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
