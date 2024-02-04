import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';

class BottomPickerButton extends StatelessWidget {
  final Function onClick;
  final List<Color> gradientColors;
  final Color? solidColor;
  final double? buttonPadding;
  final double? buttonWidth;
  final Widget? buttonChild;
  final BoxDecoration? style;

  const BottomPickerButton({
    Key? key,
    required this.onClick,
    this.gradientColors = blueThemeColor,
    this.solidColor,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonChild,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick.call();
      },
      child: Container(
        width: buttonWidth ?? 100,
        padding: EdgeInsets.all(buttonPadding ?? 8.0),
        decoration: style ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: solidColor,
              gradient: solidColor == null
                  ? LinearGradient(
                      colors: gradientColors,
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: const [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    )
                  : null,
            ),
        child: buttonChild ??
            const Center(
              child: Text(
                'Select',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
      ),
    );
  }
}
