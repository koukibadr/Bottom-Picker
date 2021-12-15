import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';

extension BottomPickerExtension on BottomPicker {

  List<Color> get gradientColor => gradientColors != null ? gradientColors! : defaultColors[bottomPickerTheme]!;

}