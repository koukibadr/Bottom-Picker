import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimplePicker extends StatelessWidget {
  final int selectedItemIndex;
  final Function(int)? onChange;
  final List<Text> items;

  const SimplePicker({
    Key? key,
    required this.items,
    required this.onChange,
    required this.selectedItemIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 35,
      scrollController: FixedExtentScrollController(
        initialItem: selectedItemIndex,
      ),
      onSelectedItemChanged: onChange,
      children: items,
    );
  }
}
