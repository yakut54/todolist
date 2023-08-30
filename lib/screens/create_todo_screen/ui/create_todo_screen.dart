import 'package:flutter/material.dart';
import 'package:todolist/screens/create_todo_screen/index.dart';
import 'package:todolist/theme/constants.dart';
import 'package:todolist/widgets/index.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {

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
                  children: [
                    DropDownWidget(),
                    DegreeImportanceIconWidget()
                  ],
                ),
              ),
              // DatePickerDialog(
              //   initialDate: DateTime(2023, 12, 24),
              //   firstDate: DateTime(1900),
              //   lastDate: DateTime(2100),
              //   keyboardType: TextInputType.text,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
