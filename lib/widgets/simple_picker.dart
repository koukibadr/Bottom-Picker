import 'package:flutter/cupertino.dart';

class SimplePicker extends StatelessWidget {
  final int selectedItemIndex;
  final Function(int)? onChange;
  final List<Text> items;
  final TextStyle textStyle;
  final double itemExtent;

  const SimplePicker({
    Key? key,
    required this.items,
    required this.onChange,
    required this.selectedItemIndex,
    required this.textStyle,
    required this.itemExtent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          pickerTextStyle: textStyle,
        ),
      ),
      child: CupertinoPicker(
        itemExtent: itemExtent,
        scrollController: FixedExtentScrollController(
          initialItem: selectedItemIndex,
        ),
        onSelectedItemChanged: onChange,
        children: items,
      ),
    );
  }
}
