import 'package:bottom_picker/resources/arrays.dart';
import 'package:bottom_picker/widgets/bottom_picker_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class BottomPicker extends StatefulWidget {
  final String title;
  final TextStyle titleStyle;
  final bool dismissable;
  late List<Text>? items;

  final Function(dynamic)? onChange;
  final Function(dynamic)? onSubmit;
  final Function? onClose;

  late CupertinoDatePickerMode datePickerMode;
  late BOTTOM_PICKER_TYPE bottomPickerType;

  final BOTTOM_PICKER_THEME bottomPickerTheme;
  final List<Color>? gradientColors;

  BottomPicker(
      {required this.title,
      required this.items,
      this.titleStyle = const TextStyle(),
      this.dismissable = false,
      this.onChange,
      this.onSubmit,
      this.onClose,
      this.bottomPickerTheme = BOTTOM_PICKER_THEME.BLUE,
      this.gradientColors}) {
    this.bottomPickerType = BOTTOM_PICKER_TYPE.SIMPLE;
    assert(this.items != null && this.items!.isNotEmpty);
  }

  BottomPicker.date(
      {required this.title,
      this.titleStyle = const TextStyle(),
      this.dismissable = false,
      this.onChange,
      this.onSubmit,
      this.onClose,
      this.bottomPickerTheme = BOTTOM_PICKER_THEME.BLUE,
      this.gradientColors}) {
    this.datePickerMode = CupertinoDatePickerMode.date;
    this.bottomPickerType = BOTTOM_PICKER_TYPE.DATETIME;
  }

  BottomPicker.dateTime(
      {required this.title,
      this.titleStyle = const TextStyle(),
      this.dismissable = false,
      this.onChange,
      this.onSubmit,
      this.onClose,
      this.bottomPickerTheme = BOTTOM_PICKER_THEME.BLUE,
      this.gradientColors}) {
    this.datePickerMode = CupertinoDatePickerMode.dateAndTime;
    this.bottomPickerType = BOTTOM_PICKER_TYPE.DATETIME;
  }

  BottomPicker.time(
      {required this.title,
      this.titleStyle = const TextStyle(),
      this.dismissable = false,
      this.onChange,
      this.onSubmit,
      this.onClose,
      this.bottomPickerTheme = BOTTOM_PICKER_THEME.BLUE,
      this.gradientColors}) {
    this.datePickerMode = CupertinoDatePickerMode.time;
    this.bottomPickerType = BOTTOM_PICKER_TYPE.DATETIME;
  }

  show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: this.dismissable,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BottomSheet(
              backgroundColor: Colors.transparent,
              onClosing: () {},
              builder: (context) {
                return this;
              });
        });
  }

  @override
  _BottomPickerState createState() => _BottomPickerState();
}

class _BottomPickerState extends State<BottomPicker> {
  late int selectedItemIndex;
  late DateTime selectedDateTime;

  @override
  void initState() {
    super.initState();
    this.selectedItemIndex = 0;
    this.selectedDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(this.widget.title, style: this.widget.titleStyle),
                  InkWell(
                      onTap: _closeBottomPicker,
                      child: Icon(Icons.close, color: Colors.black, size: 20))
                ],
              ),
            ),
            this.widget.bottomPickerType == BOTTOM_PICKER_TYPE.SIMPLE
                ? _renderSimplePicker()
                : _renderDateTimePicker(this.widget.datePickerMode),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomPickerButton(
                  onClick: () {
                    if (this.widget.bottomPickerType ==
                        BOTTOM_PICKER_TYPE.SIMPLE) {
                      this.widget.onSubmit?.call(this.selectedItemIndex);
                    } else {
                      this.widget.onSubmit?.call(this.selectedDateTime);
                    }
                    Navigator.pop(context);
                  },
                  gradientColors: getGradientColor(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _renderSimplePicker() {
    return Container(
      height: 200,
      width: 250,
      child: CupertinoPicker(
          itemExtent: 35,
          onSelectedItemChanged: (int index) {
            this.selectedItemIndex = index;
            this.widget.onChange?.call(index);
          },
          children: this.widget.items!),
    );
  }

  _renderDateTimePicker(CupertinoDatePickerMode mode) {
    return Container(
      height: 150,
      child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime date) {
            this.widget.onChange?.call(date);
          }),
    );
  }

  _closeBottomPicker() {
    Navigator.pop(context);
    this.widget.onClose?.call();
  }
  
  List<Color> getGradientColor() {
    if (this.widget.gradientColors != null) {
      return this.widget.gradientColors!;
    } else {
      return DEFAULT_COLORS[this.widget.bottomPickerTheme]!;
    }
  }
}
