import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/todo_bloc.dart';
import '/theme/constants.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownState();
}

class _DropDownState extends State<DropDownWidget> {
  final TextEditingController _controller = TextEditingController();
  ImportanceLabel? selectedLabel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        final List<DropdownMenuEntry<ImportanceLabel>> imortanceEntries = [];

        for (final ImportanceLabel item in ImportanceLabel.values) {
          imortanceEntries.add(
            DropdownMenuEntry<ImportanceLabel>(
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
              ),
            ),
          );
        }

        return Expanded(
          child: SizedBox(
            child: DropdownMenu<ImportanceLabel>(
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
              initialSelection: _getImortance(state),
              trailingIcon: const Icon(
                size: 30,
                Icons.keyboard_arrow_down_outlined,
                color: GeneralColors.orangePeach,
              ),
              dropdownMenuEntries: imortanceEntries,
              onSelected: (ImportanceLabel? value) {
                setState(() {
                  selectedLabel = value;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

enum ImportanceLabel {
  green('Важно', GeneralColors.green, Icons.looks_3),
  blue('Очень Важно', GeneralColors.blue, Icons.looks_two),
  violet('Критически Важно', GeneralColors.violet, Icons.looks_one);

  const ImportanceLabel(this.name, this.color, this.icon);

  final String name;
  final Color color;
  final IconData icon;
}

ImportanceLabel _getImortance(TodoState state) {
  String importance = state.editableTodo!.importance;

  if (importance == 'green') {
    return ImportanceLabel.green;
  }
  if (importance == 'blue') {
    return ImportanceLabel.blue;
  }
  return ImportanceLabel.violet;
}
