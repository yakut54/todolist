import 'package:flutter/material.dart';
import 'package:todolist/widgets/index.dart';

final appBar = AppBar(
  centerTitle: true,
  title: Text(
    'Todo list'.toUpperCase(),
    textAlign: TextAlign.center,
  ),
  actions: const [AddBtn()],
);
