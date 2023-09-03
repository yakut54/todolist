import 'package:flutter/material.dart';
import 'package:todolist/db/db.dart';
import 'package:todolist/screens/create_todo_screen/index.dart';
import 'package:todolist/theme/constants.dart';
import 'package:todolist/widgets/index.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  DateTime date = DateTime.now();

  void selectDatePicker() async {
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1999),
      lastDate: DateTime(2030),
      builder: (context, child) {
        final theme = Theme.of(context);

        return Theme(
          data: theme.copyWith(
            colorScheme: const ColorScheme.light(
              primary: GeneralColors.platinum, // header background color
              onPrimary: GeneralColors.grayblue, // header text color
              onSurface: GeneralColors.grayblue,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: GeneralColors.darkTurquoise, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (datePicker != null && datePicker != date) {
      date = datePicker;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: GeneralColors.orangePeach,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Create Screen'.toUpperCase()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TextFieldWidget(),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [DropDownWidget(), DegreeImportanceIconWidget()],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(
                            vertical: 9,
                            horizontal: 15,
                          ),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll(GeneralColors.platinum),
                      ),
                      child: const Text(
                        'Дедлайн',
                        style: TextStyle(
                          fontFamily: FontFamily.semiFont,
                          fontSize: FontSize.mainFont,
                          color: GeneralColors.grayblue,
                        ),
                      ),
                      onPressed: () {
                        selectDatePicker();
                        print(date.microsecondsSinceEpoch);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(
                            vertical: 9,
                            horizontal: 15,
                          ),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll(GeneralColors.orangePeach),
                      ),
                      child: const Text(
                        'Cохранить',
                        style: TextStyle(
                          fontFamily: FontFamily.semiFont,
                          fontSize: FontSize.mainFont,
                          color: GeneralColors.grayblue,
                        ),
                      ),
                      onPressed: () {
                        print('Save for Database');
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// DatePickerDialog(
//   initialDate: DateTime(2023, 12, 24),
//   firstDate: DateTime(1900),
//   lastDate: DateTime(2100),
//   keyboardType: TextInputType.text,
// ),
