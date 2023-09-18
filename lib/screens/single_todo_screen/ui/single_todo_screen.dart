import 'package:flutter/material.dart';
import '/theme/constants.dart';
import '/widgets/ui/background_gradient.dart';
import './rich_text.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white24,
                height: 135,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 10,
                      color: GeneralColors.violet,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichTextWidget(
                                span: 'Дата создания: ',
                                bold: '29/08/2023',
                                key: Key('1')),
                            RichTextWidget(
                                span: 'Времени прошло: ',
                                bold: '2д 14ч 18м',
                                key: Key('2')),
                            RichTextWidget(
                                span: 'Дедлайн: ',
                                bold: '31/12/2023',
                                key: Key('3')),
                            RichTextWidget(
                                span: 'Времени осталось: ',
                                bold: '125д 17ч 3м',
                                key: Key('4')),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 195,
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
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(GeneralColors.platinum),
                      ),
                      onPressed: () {
                        // Делаем что-нибудь, когда кнопка нажата.
                      },
                      child: const Text(
                        'Редактировать',
                        style: TextStyle(
                          fontFamily: FontFamily.semiFont,
                          fontSize: FontSize.mainFont,
                          color: GeneralColors.grayblue,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            GeneralColors.orangePeach,
                          ),
                        ),
                        onPressed: () {
                          // Делаем что-нибудь, когда кнопка нажата.
                        },
                        child: const Text(
                          'Удалить',
                          style: TextStyle(
                            fontSize: FontSize.mainFont,
                            color: GeneralColors.grayblue,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
