import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SimplePicker extends StatelessWidget {
  final int selectedItemIndex;
  final Function(int)? onChange;
  final List<Widget> items;
  final TextStyle textStyle;
  final double itemExtent;
  final Widget? selectionOverlay;
  final CupertinoTextThemeData? pickerThemeData;

  const SimplePicker({
    super.key,
    required this.items,
    required this.onChange,
    required this.selectedItemIndex,
    required this.textStyle,
    required this.itemExtent,
    this.selectionOverlay,
    this.pickerThemeData,
  });

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
      return CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: pickerThemeData ?? CupertinoTextThemeData(
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
      return ListWheelScrollView(
        itemExtent: itemExtent,
        children: items,
        useMagnifier: true,
        magnification: 1.5,
        controller: FixedExtentScrollController(
          initialItem: selectedItemIndex,
        ),
        onSelectedItemChanged: onChange,
      );
    }
  }
}
