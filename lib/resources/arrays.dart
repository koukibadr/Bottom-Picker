import 'package:flutter/cupertino.dart';

enum BOTTOM_PICKER_TYPE { SIMPLE, DATETIME }

enum BOTTOM_PICKER_THEME {
  BLUE,
  ORANGE,
  TEMPTING_AZURE,
  HEAVY_RAIN,
  PLUM_PLATE,
  MORNING_SALAD
}

const List<Color> BLUE_THEME_COLOR = [
  const Color(0xFF3366FF),
  const Color(0xFF00CCFF),
];
const List<Color> ORNAGE_THEME_COLOR = [
  const Color(0xFFf6d365),
  const Color(0xFFfda085),
];
const List<Color> TEMPTING_AZURE = [
  const Color(0xFF84fab0),
  const Color(0xFF8fd3f4),
];
const List<Color> HEAVY_RAIN = [
  const Color(0xFFcfd9df),
  const Color(0xFFe2ebf0),
];
const List<Color> PLUM_PLATE = [
  const Color(0xFF667eea),
  const Color(0xFF764ba2),
];
const List<Color> MORNING_SALAD = [
  const Color(0xFFB7F8DB),
  const Color(0xFF50A7C2),
];

const Map<BOTTOM_PICKER_THEME, List<Color>> DEFAULT_COLORS = {
  BOTTOM_PICKER_THEME.BLUE: BLUE_THEME_COLOR,
  BOTTOM_PICKER_THEME.ORANGE: ORNAGE_THEME_COLOR,
  BOTTOM_PICKER_THEME.TEMPTING_AZURE: TEMPTING_AZURE,
  BOTTOM_PICKER_THEME.HEAVY_RAIN: HEAVY_RAIN,
  BOTTOM_PICKER_THEME.PLUM_PLATE: PLUM_PLATE,
  BOTTOM_PICKER_THEME.MORNING_SALAD: MORNING_SALAD,
};
