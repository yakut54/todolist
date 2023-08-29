import 'package:flutter/material.dart';
import 'package:todolist/theme/constants.dart';
import 'package:todolist/widgets/ui/background_gradient.dart';
import 'rich_text.dart';

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
            icon: const Icon(
              Icons.arrow_back_ios,
              color: GeneralColors.orangePeach,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Single Screen'.toUpperCase()),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white24,
              height: 135,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichTextWidget(
                              span: 'Дата создания: ', bold: '29/08/2023'),
                          RichTextWidget(
                              span: 'Времени прошло: ', bold: '2д 14ч 18м'),
                          RichTextWidget(span: 'Дедлайн: ', bold: '31/12/2023'),
                          RichTextWidget(
                              span: 'Времени осталось: ', bold: '125д 17ч 3м'),
                        ],
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: const Triangle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: Align(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: const SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: Text(
                            '''
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        ''',
                            style: TextStyle(
                              color: GeneralColors.darkTurquoise,
                              fontSize: FontSize.mainFont,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
      width: 50,
      height: 50,
      decoration: const BoxDecoration(color: GeneralColors.blue),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
