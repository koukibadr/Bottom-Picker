import 'package:flutter/material.dart';

class WebPickerItem extends StatelessWidget {
  final List<Text> items;
  final String title;
  final TextStyle? titleStyle;

  const WebPickerItem(
      {Key? key, required this.items, required this.title, this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
