import 'package:flutter/cupertino.dart';

enum BottomPickerType {
  simple,
  time,
  dateTime,
  rangeDateTime,
}

enum BottomPickerTheme {
  blue,
  orange,
  temptingAzure,
  heavyRain,
  plumPlate,
  morningSalad
}

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

const Map<BottomPickerTheme, List<Color>> defaultColors = {
  BottomPickerTheme.blue: blueThemeColor,
  BottomPickerTheme.orange: orangeThemeColor,
  BottomPickerTheme.temptingAzure: temptingAzure,
  BottomPickerTheme.heavyRain: heavyRain,
  BottomPickerTheme.plumPlate: plumPlate,
  BottomPickerTheme.morningSalad: morningSalad,
};
