import 'dart:io';

import 'package:flutter/cupertino.dart';

class SimplePicker extends StatelessWidget {
  final int selectedItemIndex;
  final Function(int)? onChange;
  final List<Widget> items;
  final TextStyle textStyle;
  final double itemExtent;
  final Widget? selectionOverlay;

  const SimplePicker({
    Key? key,
    required this.items,
    required this.onChange,
    required this.selectedItemIndex,
    required this.textStyle,
    required this.itemExtent,
    this.selectionOverlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isAndroid) {
      return CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            pickerTextStyle: textStyle,
          ),
        ),
        child: CupertinoPicker(
          offAxisFraction: 2.0,
          itemExtent: itemExtent,
          selectionOverlay: selectionOverlay ??
              const CupertinoPickerDefaultSelectionOverlay(),
          scrollController: FixedExtentScrollController(
            initialItem: selectedItemIndex,
          ),
          onSelectedItemChanged: onChange,
          children: items,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
            ),
            child: items[index],
          );
        },
      );
    }
  }
}
