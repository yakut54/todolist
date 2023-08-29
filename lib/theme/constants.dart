import 'dart:ui';

abstract class TileIcons {
  static const double size = 35.0;
}

abstract class FontFamily {
  static const regularFont = 'akrobat_regular';
  static const semiFont = 'akrobat_semibold';
}

abstract class FontSize {
  static const double header = 26;
  static const double tileTitle = 26;
  static const double tileSubtitle = 20;
  static const double mainFont = 20;
}

abstract class GeneralColors {
  static const Color grayblue = Color(0xFF2C3531);
  static const Color darkTurquoise = Color(0xFF116466);
  static const Color tanColor = Color(0xFFD9B08C);
  static const Color orangePeach = Color(0xFFFFCB9A);
  static const Color platinum = Color(0xFFD1E8E2);
  static const Color green = Color.fromARGB(108, 0, 255, 0);
  static const Color blue = Color.fromARGB(227, 32, 32, 255);
  static const Color fiolet = Color.fromARGB(255, 105, 0, 198);
}
