import 'package:bottom_picker/resources/arrays.dart';
import 'package:bottom_picker/widgets/bottom_picker_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomPicker extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final bool dismissable;
  late List<Text>? items;

  late CupertinoDatePickerMode datePickerMode;
  late BOTTOM_PICKER_TYPE bottomPickerType;

  BottomPicker(
      {required this.title,
      required this.items,
      this.titleStyle = const TextStyle(),
      this.dismissable = false}) {
    this.bottomPickerType = BOTTOM_PICKER_TYPE.SIMPLE;
    assert(this.items != null && this.items!.isNotEmpty);
  }

  BottomPicker.date(
      {required this.title,
      this.titleStyle = const TextStyle(),
      this.dismissable = false}) {
    this.datePickerMode = CupertinoDatePickerMode.date;
    this.bottomPickerType = BOTTOM_PICKER_TYPE.DATETIME;
  }

  BottomPicker.dateTime(
      {required this.title,
      this.titleStyle = const TextStyle(),
      this.dismissable = false}) {
    this.datePickerMode = CupertinoDatePickerMode.dateAndTime;
    this.bottomPickerType = BOTTOM_PICKER_TYPE.DATETIME;
  }

  BottomPicker.time(
      {required this.title,
      this.titleStyle = const TextStyle(),
      this.dismissable = false}) {
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
                  Text(this.title, style: this.titleStyle),
                  Icon(Icons.close, color: Colors.black, size: 20)
                ],
              ),
            ),
            this.bottomPickerType == BOTTOM_PICKER_TYPE.SIMPLE
                ? _renderSimplePicker()
                : _renderDateTimePicker(this.datePickerMode),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomPickerButton(),
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
          onSelectedItemChanged: (int) {},
          children: this.items!),
    );
  }

  _renderDateTimePicker(CupertinoDatePickerMode mode) {
    return Container(
      height: 150,
      child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime date) {}),
    );
  }
}
