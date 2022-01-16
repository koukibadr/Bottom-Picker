import 'package:flutter/cupertino.dart';

enum BOTTOM_PICKER_TYPE { simple, dateTime }

enum BOTTOM_PICKER_THEME {
  blue,
  orange,
  temptingAzure,
  heavyRain,
  plumPlate,
  morningSalad
}

enum LAYOUT_ORIENTATION { ltr, rtl }

const List<Color> blueThemeColor = [
  Color(0xFF3366FF),
  Color(0xFF00CCFF),
];
const List<Color> orangeThemeColor = [
  Color(0xFFf6d365),
  Color(0xFFfda085),
];
const List<Color> temptingAzure = [
  Color(0xFF84fab0),
  Color(0xFF8fd3f4),
];
const List<Color> heavyRain = [
  Color(0xFFcfd9df),
  Color(0xFFe2ebf0),
];
const List<Color> plumPlate = [
  Color(0xFF667eea),
  Color(0xFF764ba2),
];
const List<Color> morningSalad = [
  Color(0xFFB7F8DB),
  Color(0xFF50A7C2),
];

const Map<BOTTOM_PICKER_THEME, List<Color>> defaultColors = {
  BOTTOM_PICKER_THEME.blue: blueThemeColor,
  BOTTOM_PICKER_THEME.orange: orangeThemeColor,
  BOTTOM_PICKER_THEME.temptingAzure: temptingAzure,
  BOTTOM_PICKER_THEME.heavyRain: heavyRain,
  BOTTOM_PICKER_THEME.plumPlate: plumPlate,
  BOTTOM_PICKER_THEME.morningSalad: morningSalad,
};
