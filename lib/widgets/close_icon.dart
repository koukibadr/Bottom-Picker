import 'package:flutter/material.dart';

/// A close icon widget that can be used to close the picker.
class CloseIcon extends StatelessWidget {
  /// The callback function that is called when the close icon is pressed.
  final Function() onPress;

  /// The color of the close icon.
  final Color? iconColor;

  /// The size of the close icon.
  final double? closeIconSize;

  const CloseIcon({
    super.key,
    required this.onPress,
    required this.iconColor,
    required this.closeIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Icon(
        Icons.close,
        color: iconColor,
        size: closeIconSize,
      ),
    );
  }
}
