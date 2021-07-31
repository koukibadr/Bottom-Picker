import 'package:flutter/cupertino.dart';

enum BOTTOM_PICKER_TYPE { SIMPLE, DATETIME }

enum BOTTOM_PICKER_THEME { BLUE, ORANGE }

const List<Color> BLUE_THEME_COLOR = [
  const Color(0xFF3366FF),
  const Color(0xFF00CCFF),
];

const Map<BOTTOM_PICKER_THEME, List<Color>> DEFAULT_COLORS = {
  BOTTOM_PICKER_THEME.BLUE: BLUE_THEME_COLOR
};
