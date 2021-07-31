import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';

class BottomPickerButton extends StatelessWidget {
  final Function onClick;
  final List<Color> gradientColors;
  final Color iconColor;

  BottomPickerButton(
      {required this.onClick,
      required this.iconColor,
      this.gradientColors = BLUE_THEME_COLOR});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.onClick.call();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient(
                colors: gradientColors,
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Icon(Icons.done, color: this.iconColor, size: 20),
        ),
      ),
    );
  }
}
