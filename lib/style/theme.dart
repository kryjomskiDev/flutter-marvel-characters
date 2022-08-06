import 'package:flutter/material.dart';
import 'package:marvel_characters/style/colors.dart';

class ThemeModel with ChangeNotifier {
  AppTheme _currentTheme = StandardTheme();

  AppTheme get theme => _currentTheme;

  void setTheme(theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}

abstract class AppTheme implements AppColorBase {}

class StandardTheme extends AppTheme {
  @override
  Color bgColor = AppStandardColors.bgColor;

  @override
  Color black = AppStandardColors.black;

  @override
  Color grey = AppStandardColors.grey;

  @override
  Color white = AppStandardColors.white;

  @override
  Color transparent = AppStandardColors.transparent;
}
