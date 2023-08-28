import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/widgets/ui/background_gradient.dart';

class SingleTodoScreen extends StatefulWidget {
  const SingleTodoScreen({super.key});

  @override
  State<SingleTodoScreen> createState() => _SingleTodoScreenState();
}

class _SingleTodoScreenState extends State<SingleTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                color: GeneralColors.orangePeach),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Single Screen'.toUpperCase()),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: Triangle2(),
                ),
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: const Triangle(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Triangle extends StatelessWidget {
  const Triangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: GeneralColors.platinum),
    );
  }
}

class Triangle2 extends StatelessWidget {
  const Triangle2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 250,
      height: 200,
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print(2222);
    Path path = Path()
      ..lineTo(size.width, 0) // Добавить отрезок p1p2
      ..lineTo(size.width, size.height) // Добавить отрезок p2p3
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
