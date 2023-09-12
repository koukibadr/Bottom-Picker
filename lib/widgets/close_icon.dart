import 'package:flutter/material.dart';

class CloseIcon extends StatelessWidget {
  final Function() onPress;
  final Color iconColor;
  final double closeIconSize;

  const CloseIcon({Key? key, required this.onPress, required this.iconColor, required this.closeIconSize})
      : super(key: key);

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
