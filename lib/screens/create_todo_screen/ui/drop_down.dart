import 'package:flutter/material.dart';
import '/theme/constants.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownState();
}

class _DropDownState extends State<DropDownWidget> {
  final TextEditingController _controller = TextEditingController();
  ImortanceLabel? selectedLabel;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ImortanceLabel>> imortanceEntries = [];
    for (final ImortanceLabel item in ImortanceLabel.values) {
      imortanceEntries.add(
        DropdownMenuEntry<ImortanceLabel>(
            leadingIcon: Icon(
              item.icon,
              color: item.color,
            ),
            value: item,
            label: item.name,
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(GeneralColors.grayblue),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                    fontFamily: FontFamily.regularFont, fontSize: 22),
              ),
            )),
      );
    }

    return Expanded(
      child: SizedBox(
        child: DropdownMenu<ImortanceLabel>(
          controller: _controller,
          width: MediaQuery.of(context).size.width - 100,
          textStyle: const TextStyle(
            color: GeneralColors.platinum,
            fontFamily: FontFamily.regularFont,
            fontSize: 22,
          ),
          menuStyle: MenuStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(GeneralColors.platinum),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white12,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2,
                color: GeneralColors.orangePeach,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2,
                color: GeneralColors.orangePeach,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          initialSelection: ImortanceLabel.green,
          trailingIcon: const Icon(
            size: 30,
            Icons.keyboard_arrow_down_outlined,
            color: GeneralColors.orangePeach,
          ),
          dropdownMenuEntries: imortanceEntries,
          onSelected: (ImortanceLabel? value) {
            setState(() {
              selectedLabel = value;
            });
          },
        ),
      ),
    );
  }
}

enum ImortanceLabel {
  green('Важно', GeneralColors.green, Icons.looks_3),
  blue('Очень Важно', GeneralColors.blue, Icons.looks_two),
  violet('Критически Важно', GeneralColors.violet, Icons.looks_one);

  const ImortanceLabel(this.name, this.color, this.icon);

  final String name;
  final Color color;
  final IconData icon;
}
