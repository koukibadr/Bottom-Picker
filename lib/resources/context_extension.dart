import 'package:bottom_picker/resources/values.dart';
import 'package:flutter/cupertino.dart';

extension ContextExtensions on BuildContext {
  double get bottomPickerWidth =>
      MediaQuery.of(this).size.width >= tabletMinSize
          ? MediaQuery.of(this).size.width * 0.7
          : MediaQuery.of(this).size.width;

  double get bottomPickerHeight =>
      MediaQuery.of(this).size.height >= tabletMinSize
          ? MediaQuery.of(this).size.height * 0.35
          : MediaQuery.of(this).size.height * 0.45;
}
