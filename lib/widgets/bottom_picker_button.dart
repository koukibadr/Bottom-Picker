import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';

class BottomPickerButton extends StatelessWidget {
  final Function onClick;
  final BottomPickerTheme theme;
  final List<Color>? gradients;
  final Color? solidColor;
  final double? buttonPadding;
  final double? buttonWidth;
  final Widget? buttonChild;
  final BoxDecoration? style;

  const BottomPickerButton({
    super.key,
    required this.onClick,
    this.theme = BottomPickerTheme.blue,
    this.gradients,
    this.solidColor,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonChild,
    this.style,
  });

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
                      colors: gradients ?? theme.gradientColors,
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
