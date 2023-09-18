import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/router/router.dart';
import '/theme/theme.dart';

import 'bloc/todo_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo List',
        theme: theme,
        routes: routes,
      ),
    );
  }
}
