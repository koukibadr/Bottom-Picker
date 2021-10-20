import 'package:bottom_picker/resources/arrays.dart';
import 'package:bottom_picker/widgets/bottom_picker_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class BottomPicker extends StatefulWidget {
  ///The dateTime picker mode
  ///[CupertinoDatePickerMode.date] or [CupertinoDatePickerMode.dateAndTime] or [CupertinoDatePickerMode.time]
  ///
  late CupertinoDatePickerMode datePickerMode;

  ///the bottom picker type
  ///```dart
  ///{
  ///SIMPLE,
  ///DATETIME
  ///}
  ///```
  late BOTTOM_PICKER_TYPE bottomPickerType;

  BottomPicker(
      {required this.title,
      required this.items,
      this.titleStyle = const TextStyle(),
      this.dismissable = false,
      this.onChange,
      this.onSubmit,
      this.onClose,
      this.bottomPickerTheme = BOTTOM_PICKER_THEME.BLUE,
      this.gradientColors,
      this.iconColor = Colors.white,
      this.selectedItemIndex = 0,
      this.buttonText,
      this.buttonTextStyle,
      this.displayButtonIcon = true,
      this.buttonSingleColor}) {
    this.bottomPickerType = BOTTOM_PICKER_TYPE.SIMPLE;
    assert(this.items != null && this.items!.isNotEmpty);
    assert(this.selectedItemIndex >= 0);
    if (this.selectedItemIndex > 0) {
      assert(this.selectedItemIndex < this.items!.length);
    }
  }

  BottomPicker.date(
      {required this.title,
      this.titleStyle = const TextStyle(),
      this.dismissable = false,
      this.onChange,
      this.onSubmit,
      this.onClose,
      this.bottomPickerTheme = BOTTOM_PICKER_THEME.BLUE,
      this.gradientColors,
      this.iconColor = Colors.white,
      this.initialDateTime,
      this.minDateTime,
      this.maxDateTime,
      this.buttonText,
      this.buttonTextStyle,
      this.displayButtonIcon = true,
      this.buttonSingleColor}) {
    this.datePickerMode = CupertinoDatePickerMode.date;
    this.bottomPickerType = BOTTOM_PICKER_TYPE.DATETIME;
    this.use24hFormat = false;
    if (this.minDateTime != null && this.maxDateTime != null) {
      assert(this.minDateTime!.isBefore(this.maxDateTime!));
    }
    if (this.maxDateTime != null &&
        this.initialDateTime == null &&
        DateTime.now().isAfter(this.maxDateTime!)) {
      this.initialDateTime = this.maxDateTime;
    }

    if (this.minDateTime != null &&
        this.initialDateTime == null &&
        DateTime.now().isBefore(this.minDateTime!)) {
      this.initialDateTime = this.minDateTime;
    }
  }

  BottomPicker.dateTime(
      {required this.title,
      this.titleStyle = const TextStyle(),
      this.dismissable = false,
      this.onChange,
      this.onSubmit,
      this.onClose,
      this.bottomPickerTheme = BOTTOM_PICKER_THEME.BLUE,
      this.gradientColors,
      this.iconColor = Colors.white,
      this.selectedItemIndex = 0,
      this.initialDateTime,
      this.minDateTime,
      this.maxDateTime,
      this.use24hFormat = false,
      this.buttonText,
      this.buttonTextStyle,
      this.displayButtonIcon = true,
      this.buttonSingleColor}) {
    this.datePickerMode = CupertinoDatePickerMode.dateAndTime;
    this.bottomPickerType = BOTTOM_PICKER_TYPE.DATETIME;
    if (this.minDateTime != null && this.maxDateTime != null) {
      assert(this.minDateTime!.isBefore(this.maxDateTime!));
    }

    if (this.maxDateTime != null &&
        this.initialDateTime == null &&
        DateTime.now().isAfter(this.maxDateTime!)) {
      this.initialDateTime = this.maxDateTime;
    }

    if (this.minDateTime != null &&
        this.initialDateTime == null &&
        DateTime.now().isBefore(this.minDateTime!)) {
      this.initialDateTime = this.minDateTime;
    }
  }

  BottomPicker.time(
      {required this.title,
      this.titleStyle = const TextStyle(),
      this.dismissable = false,
      this.onChange,
      this.onSubmit,
      this.onClose,
      this.bottomPickerTheme = BOTTOM_PICKER_THEME.BLUE,
      this.gradientColors,
      this.iconColor = Colors.white,
      this.selectedItemIndex = 0,
      this.initialDateTime,
      this.minDateTime,
      this.maxDateTime,
      this.use24hFormat = false,
      this.buttonText,
      this.buttonTextStyle,
      this.displayButtonIcon = true,
      this.buttonSingleColor}) {
    this.datePickerMode = CupertinoDatePickerMode.time;
    this.bottomPickerType = BOTTOM_PICKER_TYPE.DATETIME;
    if (this.minDateTime != null && this.maxDateTime != null) {
      assert(this.minDateTime!.isBefore(this.maxDateTime!));
    }

    if (this.maxDateTime != null &&
        this.initialDateTime == null &&
        DateTime.now().isAfter(this.maxDateTime!)) {
      this.initialDateTime = this.maxDateTime;
    }

    if (this.minDateTime != null &&
        this.initialDateTime == null &&
        DateTime.now().isBefore(this.minDateTime!)) {
      this.initialDateTime = this.minDateTime;
    }
  }

  ///The title of the bottom picker
  ///it's required for all bottom picker types
  ///
  final String title;

  ///The text style applied on the title
  ///by default it applies simple text style
  ///
  final TextStyle titleStyle;

  ///defines whether the bottom picker is dismissable or not
  ///by default it's set to false
  ///
  final bool dismissable;

  ///list of items (List of text) used to create simple item picker (required)
  ///and should not be empty or null
  ///
  ///for date/dateTime/time items parameter is not available
  ///
  late List<Text>? items;

  ///Nullable function, invoked when navigating between picker items
  ///whether it's date picker or simple item picker it will return a value DateTime or int(index)
  ///
  final Function(dynamic)? onChange;

  ///Nullable function invoked  when clicking on submit button
  ///if the picker  type is date/time/dateTime it will return DateTime value
  ///else it will return the index of the selected item
  ///
  final Function(dynamic)? onSubmit;

  ///Invoked when clicking on the close button
  ///
  final Function? onClose;

  ///set the theme of the bottom picker (the button theme)
  ///possible values
  ///```
  ///{
  ///BLUE,
  ///ORANGE,
  ///TEMPTING_AZURE,
  ///HEAVY_RAIN,
  ///PLUM_PLATE,
  ///MORNING_SALAD
  ///}
  ///```
  final BOTTOM_PICKER_THEME bottomPickerTheme;

  ///to set a custom button theme color use this list
  ///when it's not null it will be applied
  ///
  final List<Color>? gradientColors;

  ///define the icon color on the button
  ///by default it's White
  ///
  final Color iconColor;

  ///used for simple bottom picker
  ///by default it's 0, needs to be in the range [0, this.items.length-1]
  ///otherwise an exception will be thrown
  ///for date and time picker type this parameter is not available
  ///
  late int selectedItemIndex;

  ///The initial date time applied on the date and time picker
  ///by default it's null
  ///
  DateTime? initialDateTime;

  ///the max date time on the date picker
  ///by default it's null
  DateTime? maxDateTime;

  ///the minimum date & time applied on the date picker
  ///by default it's null
  ///
  DateTime? minDateTime;

  ///define whether the time uses 24h or 12h format
  ///by default it's false (12h format)
  ///
  late bool use24hFormat;

  final String? buttonText;

  final TextStyle? buttonTextStyle;

  final bool displayButtonIcon;

  final Color? buttonSingleColor;

  ///display the bottom picker popup
  ///[context] the app context to display the popup
  ///
  show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: this.dismissable,
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BottomSheet(
              backgroundColor: Colors.transparent,
              enableDrag: false,
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
    print(MediaQuery.of(context).size.height);
    return Container(
      height: MediaQuery.of(context).size.height > 1000? MediaQuery.of(context).size.height  * 0.25: MediaQuery.of(context).size.height * 0.3,
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
            Expanded(
                child: this.widget.bottomPickerType == BOTTOM_PICKER_TYPE.SIMPLE
                    ? _renderSimplePicker()
                    : _renderDateTimePicker(this.widget.datePickerMode)),
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
                  iconColor: this.widget.iconColor,
                  gradientColors: getGradientColor(),
                  text: widget.buttonText,
                  textStyle: widget.buttonTextStyle,
                  displayIcon: widget.displayButtonIcon,
                  solidColor: widget.buttonSingleColor
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _renderSimplePicker() {
    return CupertinoPicker(
        itemExtent: 35,
        scrollController: FixedExtentScrollController(
            initialItem: this.widget.selectedItemIndex),
        onSelectedItemChanged: (int index) {
          this.selectedItemIndex = index;
          this.widget.onChange?.call(index);
        },
        children: this.widget.items!);
  }

  Widget _renderDateTimePicker(CupertinoDatePickerMode mode) {
    return CupertinoDatePicker(
        mode: mode,
        onDateTimeChanged: (DateTime date) {
          this.selectedDateTime = date;
          this.widget.onChange?.call(date);
        },
        initialDateTime: this.widget.initialDateTime,
        maximumDate: this.widget.maxDateTime,
        minimumDate: this.widget.minDateTime,
        use24hFormat: this.widget.use24hFormat);
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
