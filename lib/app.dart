import 'package:flutter/material.dart';
import 'package:todolist/router/router.dart';
import 'package:todolist/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: theme,
      routes: routes,
    );
  }
}
