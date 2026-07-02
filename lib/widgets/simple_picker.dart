import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// A simple picker widget that can be used to select an item from a list of items.
class SimplePicker<T> extends StatelessWidget {
  /// The index of the selected item in the list of items.
  final int selectedItemIndex;

  /// The callback function that is called when the selected item changes.
  final Function(int)? onChange;

  /// The list of items to be displayed in the picker.
  final List<T> items;

  final Widget Function(T item, int index)? itemBuilder;

  /// The text style to be used for the items in the picker.
  final TextStyle? textStyle;

  /// The height of each item in the picker.
  final double itemExtent;

  /// The widget to be used as the selection overlay in the picker.
  final Widget? selectionOverlay;

  /// The theme data to be used for the picker.
  final CupertinoTextThemeData? pickerThemeData;

  /// The diameter ratio of the picker.
  final double diameterRatio;

  const SimplePicker({
    super.key,
    required this.items,
    this.itemBuilder,
    required this.onChange,
    required this.selectedItemIndex,
    this.textStyle,
    required this.itemExtent,
    this.selectionOverlay,
    this.pickerThemeData,
    required this.diameterRatio,
  });

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
      return CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: pickerThemeData ??
              CupertinoTextThemeData(
                pickerTextStyle: textStyle,
              ),
        ),
        child: CupertinoPicker(
          offAxisFraction: 2.0,
          diameterRatio: diameterRatio,
          itemExtent: itemExtent,
          selectionOverlay: selectionOverlay ??
              const CupertinoPickerDefaultSelectionOverlay(),
          scrollController: FixedExtentScrollController(
            initialItem: selectedItemIndex,
          ),
          useMagnifier: false,
          onSelectedItemChanged: onChange,
          children: List.generate(items.length, (index) {
            if (itemBuilder != null) {
              return itemBuilder!(items[index], index);
            } else {
              return Text(
                items[index].toString(),
                style: textStyle,
              );
            }
          }),
        ),
      );
    } else {
      return ListWheelScrollView(
        itemExtent: itemExtent,
        children: List.generate(items.length, (index) {
          if (itemBuilder != null) {
            return itemBuilder!(items[index], index);
          } else {
            return Text(
              items[index].toString(),
              style: textStyle,
            );
          }
        }),
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
