import 'package:flutter/material.dart';

abstract class AppTheme implements AppColorBase {}

abstract class AppColorBase {
  late Color bgColor;
  late Color white;
  late Color black;
  late Color grey;
  late Color transparent;
}

class AppStandardColors {
  static const bgColor = Color(0xff141414);
  static const white = Color(0xffffffff);
  static const grey = Color(0xFF4E4B4B);
  static const black = Color(0xff000000);
  static const transparent = Colors.transparent;
}
