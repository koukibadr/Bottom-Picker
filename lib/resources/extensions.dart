import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';

extension BottomPickerExtension on BottomPicker {
  List<Color> get gradientColor => gradientColors != null
      ? gradientColors!
      : defaultColors[bottomPickerTheme]!;

  void assertInitialValues() {
    if (minDateTime != null && maxDateTime != null) {
      assert(minDateTime!.isBefore(maxDateTime!));
    }
    if (maxDateTime != null &&
        initialDateTime == null &&
        DateTime.now().isAfter(maxDateTime!)) {
      initialDateTime = maxDateTime;
    }

    if (minDateTime != null &&
        initialDateTime == null &&
        DateTime.now().isBefore(minDateTime!)) {
      initialDateTime = minDateTime;
    }
  }
}
