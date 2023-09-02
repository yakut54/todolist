import 'package:flutter/material.dart';
import 'package:todolist/theme/constants.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownState();
}

class _DropDownState extends State<DropDownWidget> {
  List<String> list = ['Item 1', 'Item 2', 'Item 3'];

  List<Map<String, String>> test = [
    {'Item 1': 'huj'},
    {'Item 2': 'pesda'},
    {'Item 3': 'jigurda'}
  ];

  String? selectedItem;
  final _controller = TextEditingController();

  @override
  void initState() {
    selectedItem = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: DropdownMenu<String>(
          controller: _controller,
          width: MediaQuery.of(context).size.width / 1.3,
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
          initialSelection: list.first,
          trailingIcon: const Icon(
            size: 30,
            Icons.keyboard_arrow_down_outlined,
            color: GeneralColors.orangePeach,
          ),
          dropdownMenuEntries: list.map((String value) {
            return DropdownMenuEntry<String>(
              value: value,
              label: value,
              leadingIcon: const Icon(
                Icons.area_chart_rounded,
                color: GeneralColors.darkTurquoise,
              ),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    fontFamily: FontFamily.regularFont,
                    fontSize: 22,
                  ),
                ),
              ),
            );
          }).toList(),
          onSelected: (String? value) {
            setState(() {
              selectedItem = value!;
              print(selectedItem);
            });
          },
        ),
      ),
    );
  }
}