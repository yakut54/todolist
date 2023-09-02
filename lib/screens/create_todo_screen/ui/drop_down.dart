import 'package:flutter/material.dart';
import 'package:todolist/theme/constants.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownState();
}

class _DropDownState extends State<DropDownWidget> {
  List<Map<String, Object>> listUiData = [
    {
      'name': 'Важно',
      'icon': Icons.looks_3,
      'color': GeneralColors.green
    },
    {
      'name': 'Очень Важно',
      'icon': Icons.looks_two,
      'color': GeneralColors.blue
    },
    {
      'name': 'Критически Важно',
      'icon': Icons.looks_one,
      'color': GeneralColors.fiolet
    },
  ];

  String? selectedItem;
  final _controller = TextEditingController();

  @override
  void initState() {
    selectedItem = listUiData.first['name'] as String?;
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
          initialSelection: listUiData.first['name'] as String,
          trailingIcon: const Icon(
            size: 30,
            Icons.keyboard_arrow_down_outlined,
            color: GeneralColors.orangePeach,
          ),
          dropdownMenuEntries: listUiData.map((Map<String, Object> value) {
            return DropdownMenuEntry<String>(
              value: value['name'] as String,
              label: value['name'] as String,
              leadingIcon: Icon(
                value['icon'] as IconData,
                color: value['color'] as Color,
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
            });
          },
        ),
      ),
    );
  }
}
