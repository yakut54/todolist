import 'package:flutter/material.dart';
import 'package:todolist/widgets/index.dart';

final appBar = AppBar(
  centerTitle: true,
  title: const Text(
    'СПИСОК ДЕЛ',
    textAlign: TextAlign.center,
  ),
  actions: const [AddBtn()],
);
