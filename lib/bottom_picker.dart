import 'dart:io';

import 'package:bottom_picker/cupertino/cupertino_date_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:bottom_picker/resources/context_extension.dart';
import 'package:bottom_picker/resources/extensions.dart';
import 'package:bottom_picker/resources/time.dart';
import 'package:bottom_picker/widgets/bottom_picker_button.dart';
import 'package:bottom_picker/widgets/close_icon.dart';
import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:bottom_picker/widgets/range_picker.dart';
import 'package:bottom_picker/widgets/simple_picker.dart';
import 'package:bottom_picker/widgets/time_picker.dart';
import 'package:bottom_picker/widgets/year_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

export 'package:bottom_picker/resources/time.dart';

// ignore: must_be_immutable
class BottomPicker extends StatefulWidget {
  ///The dateTime picker mode
  ///[CupertinoDatePickerMode.date] or [CupertinoDatePickerMode.dateAndTime] or [CupertinoDatePickerMode.time]
  ///
  late CupertinoDatePickerMode datePickerMode;

  ///the bottom picker type
  ///```dart
  ///{
  ///simple,
  ///dateTime
  ///}
  ///```
  late BottomPickerType bottomPickerType;

  BottomPicker({
    super.key,
    @Deprecated('should use headerBuilder instead') this.pickerTitle,
    @Deprecated('should use headerBuilder instead') this.pickerDescription,
    required this.items,
    @Deprecated('should use headerBuilder instead') this.titleAlignment,
    @Deprecated('should use headerBuilder instead')
    this.titlePadding = const EdgeInsets.all(0),
    this.dismissable = false,
    this.onChange,
    this.onSubmit,
    this.onDismiss,
    @Deprecated('should use headerBuilder instead') this.onCloseButtonPressed,
    this.bottomPickerTheme = BottomPickerTheme.blue,
    this.gradientColors,
    this.selectedItemIndex = 0,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonSingleColor,
    this.backgroundColor = Colors.white,
    this.pickerThemeData,
    @Deprecated('should use pickerThemeData instead')
    this.pickerTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    this.itemExtent = 35.0,
    @Deprecated('should use headerBuilder instead')
    this.displayCloseIcon = true,
    @Deprecated('should use headerBuilder instead')
    this.closeIconColor = Colors.black,
    @Deprecated('should use headerBuilder instead') this.closeIconSize = 20,
    this.layoutOrientation = TextDirection.ltr,
    this.buttonAlignment = MainAxisAlignment.center,
    this.height,
    this.displaySubmitButton = true,
    this.selectionOverlay,
    this.buttonContent,
    this.buttonStyle,
    @Deprecated('should use headerBuilder instead') this.closeWidget,
    this.closeOnSubmit = true,
    this.headerBuilder,
    this.diameterRatio = 1.1,
    this.useSafeArea = false,
  }) {
    dateOrder = null;
    onRangeDateSubmitPressed = null;
    bottomPickerType = BottomPickerType.simple;
    assert(items != null && items!.isNotEmpty);
    assert(selectedItemIndex >= 0);
    if (selectedItemIndex > 0) {
      assert(selectedItemIndex < items!.length);
    }
  }

  BottomPicker.date({
    super.key,
    @Deprecated('should use headerBuilder instead') this.pickerTitle,
    @Deprecated('should use headerBuilder instead') this.pickerDescription,
    @Deprecated('should use headerBuilder instead')
    this.titlePadding = const EdgeInsets.all(0),
    @Deprecated('should use headerBuilder instead') this.titleAlignment,
    this.dismissable = false,
    this.onChange,
    this.onSubmit,
    this.onDismiss,
    @Deprecated('should use headerBuilder instead') this.onCloseButtonPressed,
    this.bottomPickerTheme = BottomPickerTheme.blue,
    this.gradientColors,
    this.initialDateTime,
    this.minDateTime,
    this.maxDateTime,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonSingleColor,
    this.backgroundColor = Colors.white,
    this.dateOrder = DatePickerDateOrder.ymd,
    this.pickerThemeData,
    @Deprecated('should use pickerThemeData instead')
    this.pickerTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    @Deprecated('should use headerBuilder instead')
    this.displayCloseIcon = true,
    @Deprecated('should use headerBuilder instead')
    this.closeIconColor = Colors.black,
    @Deprecated('should use headerBuilder instead') this.closeIconSize = 20,
    this.layoutOrientation = TextDirection.ltr,
    this.buttonAlignment = MainAxisAlignment.center,
    this.height,
    this.displaySubmitButton = true,
    this.buttonContent,
    this.buttonStyle,
    this.itemExtent = 35.0,
    @Deprecated('should use headerBuilder instead') this.closeWidget,
    this.closeOnSubmit = true,
    this.headerBuilder,
    this.calendarDays = CupertinoDatePickerWidget.fullWeek,
    this.diameterRatio = 1.1,
    this.useSafeArea = false,
  }) {
    datePickerMode = CupertinoDatePickerMode.date;
    bottomPickerType = BottomPickerType.dateTime;
    use24hFormat = false;
    onRangeDateSubmitPressed = null;
    assertInitialValues();
  }

  /// Creates a bottom picker for selecting a year.
  BottomPicker.year({
    super.key,
    this.dismissable = false,
    this.onChange,
    this.onSubmit,
    this.onDismiss,
    this.bottomPickerTheme = BottomPickerTheme.blue,
    this.gradientColors,
    this.initialDateTime,
    this.minDateTime,
    this.maxDateTime,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonSingleColor,
    this.backgroundColor = Colors.white,
    this.pickerThemeData,
    this.buttonAlignment = MainAxisAlignment.center,
    this.height,
    this.displaySubmitButton = true,
    this.buttonContent,
    this.buttonStyle,
    this.itemExtent = 35.0,
    this.diameterRatio = 1.1,
    this.headerBuilder,
    this.useSafeArea = false,
  }) {
    datePickerMode = CupertinoDatePickerMode.date;
    bottomPickerType = BottomPickerType.year;
    use24hFormat = false;
    onRangeDateSubmitPressed = null;
    displayCloseIcon = false;
    assertInitialValues();
  }

  BottomPicker.monthYear({
    super.key,
    @Deprecated('should use headerBuilder instead') this.pickerTitle,
    @Deprecated('should use headerBuilder instead') this.pickerDescription,
    @Deprecated('should use headerBuilder instead')
    this.titlePadding = const EdgeInsets.all(0),
    @Deprecated('should use headerBuilder instead') this.titleAlignment,
    this.dismissable = false,
    this.onChange,
    this.onSubmit,
    this.onDismiss,
    @Deprecated('should use headerBuilder instead') this.onCloseButtonPressed,
    this.bottomPickerTheme = BottomPickerTheme.blue,
    this.gradientColors,
    this.initialDateTime,
    this.minDateTime,
    this.maxDateTime,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonSingleColor,
    this.backgroundColor = Colors.white,
    this.pickerThemeData,
    @Deprecated('should use pickerThemeData instead')
    this.pickerTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    @Deprecated('should use headerBuilder instead')
    this.displayCloseIcon = true,
    @Deprecated('should use headerBuilder instead')
    this.closeIconColor = Colors.black,
    @Deprecated('should use headerBuilder instead') this.closeIconSize = 20,
    this.layoutOrientation = TextDirection.ltr,
    this.buttonAlignment = MainAxisAlignment.center,
    this.height,
    this.displaySubmitButton = true,
    this.buttonContent,
    this.buttonStyle,
    this.itemExtent = 35.0,
    @Deprecated('should use headerBuilder instead') this.closeWidget,
    this.closeOnSubmit = true,
    this.headerBuilder,
    this.calendarDays = CupertinoDatePickerWidget.fullWeek,
    this.diameterRatio = 1.1,
    this.useSafeArea = false,
  }) {
    datePickerMode = CupertinoDatePickerMode.monthYear;
    bottomPickerType = BottomPickerType.dateTime;
    use24hFormat = false;
    onRangeDateSubmitPressed = null;
    dateOrder = DatePickerDateOrder.mdy;
    assertInitialValues();
  }

  BottomPicker.dateTime({
    super.key,
    @Deprecated('should use headerBuilder instead') this.pickerTitle,
    @Deprecated('should use headerBuilder instead') this.pickerDescription,
    @Deprecated('should use headerBuilder instead')
    this.titlePadding = const EdgeInsets.all(0),
    @Deprecated('should use headerBuilder instead') this.titleAlignment,
    this.dismissable = false,
    this.onChange,
    this.onSubmit,
    this.onDismiss,
    @Deprecated('should use headerBuilder instead') this.onCloseButtonPressed,
    this.bottomPickerTheme = BottomPickerTheme.blue,
    this.gradientColors,
    this.initialDateTime,
    this.minuteInterval = 1,
    this.minDateTime,
    this.maxDateTime,
    this.use24hFormat = false,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonSingleColor,
    this.backgroundColor = Colors.white,
    this.dateOrder = DatePickerDateOrder.ymd,
    this.pickerThemeData,
    @Deprecated('should use pickerThemeData instead')
    this.pickerTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    @Deprecated('should use headerBuilder instead')
    this.displayCloseIcon = true,
    @Deprecated('should use headerBuilder instead')
    this.closeIconColor = Colors.black,
    @Deprecated('should use headerBuilder instead') this.closeIconSize = 20,
    this.layoutOrientation = TextDirection.ltr,
    this.buttonAlignment = MainAxisAlignment.center,
    this.height,
    this.displaySubmitButton = true,
    this.buttonContent,
    this.buttonStyle,
    this.itemExtent = 30,
    this.showTimeSeparator = false,
    @Deprecated('should use headerBuilder instead') this.closeWidget,
    this.closeOnSubmit = true,
    this.headerBuilder,
    this.calendarDays = CupertinoDatePickerWidget.fullWeek,
    this.diameterRatio = 1.1,
    this.hourPredicate,
    this.useSafeArea = false,
  }) {
    datePickerMode = CupertinoDatePickerMode.dateAndTime;
    bottomPickerType = BottomPickerType.dateTime;
    onRangeDateSubmitPressed = null;
    assertInitialValues();
  }

  BottomPicker.time({
    super.key,
    @Deprecated('should use headerBuilder instead') this.pickerTitle,
    @Deprecated('should use headerBuilder instead') this.pickerDescription,
    required this.initialTime,
    this.maxTime,
    this.minTime,
    @Deprecated('should use headerBuilder instead')
    this.titlePadding = const EdgeInsets.all(0),
    @Deprecated('should use headerBuilder instead') this.titleAlignment,
    this.dismissable = false,
    this.onChange,
    this.onSubmit,
    this.onDismiss,
    @Deprecated('should use headerBuilder instead') this.onCloseButtonPressed,
    this.bottomPickerTheme = BottomPickerTheme.blue,
    this.gradientColors,
    this.minuteInterval = 1,
    this.use24hFormat = false,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonSingleColor,
    this.backgroundColor = Colors.white,
    this.pickerThemeData,
    @Deprecated('should use pickerThemeData instead')
    this.pickerTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    @Deprecated('should use headerBuilder instead')
    this.displayCloseIcon = true,
    @Deprecated('should use headerBuilder instead')
    this.closeIconColor = Colors.black,
    @Deprecated('should use headerBuilder instead') this.closeIconSize = 20,
    this.layoutOrientation = TextDirection.ltr,
    this.buttonAlignment = MainAxisAlignment.center,
    this.height,
    this.displaySubmitButton = true,
    this.buttonContent,
    this.buttonStyle,
    this.showTimeSeparator = false,
    this.itemExtent = 30,
    @Deprecated('should use headerBuilder instead') this.closeWidget,
    this.closeOnSubmit = true,
    this.headerBuilder,
    this.calendarDays = CupertinoDatePickerWidget.fullWeek,
    this.diameterRatio = 1.1,
    this.useSafeArea = false,
  }) {
    datePickerMode = CupertinoDatePickerMode.time;
    bottomPickerType = BottomPickerType.time;
    dateOrder = null;
    onRangeDateSubmitPressed = null;
    initialDateTime = null;
    assertInitialValues();
  }

  BottomPicker.timer({
    super.key,
    @Deprecated('should use headerBuilder instead') this.pickerTitle,
    this.timerPickerMode = CupertinoTimerPickerMode.hm,
    this.timerSecondsInterval = 1,
    @Deprecated('should use headerBuilder instead') this.pickerDescription,
    this.initialTimerDuration,
    @Deprecated('should use headerBuilder instead')
    this.titlePadding = const EdgeInsets.all(0),
    @Deprecated('should use headerBuilder instead') this.titleAlignment,
    this.dismissable = false,
    this.onChange,
    this.onSubmit,
    this.onDismiss,
    this.itemExtent = 30,
    @Deprecated('should use headerBuilder instead') this.onCloseButtonPressed,
    this.bottomPickerTheme = BottomPickerTheme.blue,
    this.gradientColors,
    this.minuteInterval = 1,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonSingleColor,
    this.backgroundColor = Colors.white,
    this.pickerThemeData,
    @Deprecated('should use pickerThemeData instead')
    this.pickerTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    @Deprecated('should use headerBuilder instead')
    this.displayCloseIcon = true,
    @Deprecated('should use headerBuilder instead')
    this.closeIconColor = Colors.black,
    @Deprecated('should use headerBuilder instead') this.closeIconSize = 20,
    this.layoutOrientation = TextDirection.ltr,
    this.buttonAlignment = MainAxisAlignment.center,
    this.height,
    this.displaySubmitButton = true,
    this.buttonContent,
    this.buttonStyle,
    @Deprecated('should use headerBuilder instead') this.closeWidget,
    this.closeOnSubmit = true,
    this.headerBuilder,
    this.calendarDays = CupertinoDatePickerWidget.fullWeek,
    this.diameterRatio = 1.1,
    this.useSafeArea = false,
  }) {
    dateOrder = null;
    onRangeDateSubmitPressed = null;
    bottomPickerType = BottomPickerType.timer;
    assert(timerPickerMode != null);
    assert(itemExtent > 0);
    assert(timerSecondsInterval > 0);
  }

  BottomPicker.range({
    super.key,
    @Deprecated('should use headerBuilder instead') this.pickerTitle,
    @Deprecated('should use headerBuilder instead') this.pickerDescription,
    required this.onRangeDateSubmitPressed,
    this.onRangePickerDismissed,
    @Deprecated('should use headerBuilder instead')
    this.titlePadding = const EdgeInsets.all(0),
    @Deprecated('should use headerBuilder instead') this.titleAlignment,
    this.dismissable = false,
    @Deprecated('should use headerBuilder instead') this.onCloseButtonPressed,
    this.bottomPickerTheme = BottomPickerTheme.blue,
    this.gradientColors,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonSingleColor,
    this.backgroundColor = Colors.white,
    this.pickerThemeData,
    @Deprecated('should use pickerThemeData instead')
    this.pickerTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    @Deprecated('should use headerBuilder instead')
    this.displayCloseIcon = true,
    @Deprecated('should use headerBuilder instead')
    this.closeIconColor = Colors.black,
    @Deprecated('should use headerBuilder instead') this.closeIconSize = 20,
    this.layoutOrientation = TextDirection.ltr,
    this.buttonAlignment = MainAxisAlignment.center,
    this.height,
    this.initialSecondDate,
    this.initialFirstDate,
    this.minFirstDate,
    this.minSecondDate,
    this.maxFirstDate,
    this.maxSecondDate,
    this.dateOrder = DatePickerDateOrder.ymd,
    this.buttonContent,
    this.buttonStyle,
    this.itemExtent = 30,
    @Deprecated('should use headerBuilder instead') this.closeWidget,
    this.closeOnSubmit = true,
    this.headerBuilder,
    this.calendarDays = CupertinoDatePickerWidget.fullWeek,
    this.diameterRatio = 1.1,
    this.useSafeArea = false,
  }) {
    datePickerMode = CupertinoDatePickerMode.date;
    bottomPickerType = BottomPickerType.rangeDate;
    dateOrder = null;
    onChange = null;
    onSubmit = null;
    onDismiss = null;
    displaySubmitButton = true;
    use24hFormat = true;
    assert(onRangeDateSubmitPressed != null);
    assertInitialValues();
    if (minSecondDate != null && initialSecondDate != null) {
      assert(
        initialSecondDate!.isAtSameMomentOrAfter(minSecondDate!),
      );
    }
    if (minFirstDate != null && initialFirstDate != null) {
      assert(
        initialFirstDate!.isAtSameMomentOrAfter(minFirstDate!),
      );
    }
  }

  BottomPicker.rangeTime({
    super.key,
    @Deprecated('should use headerBuilder instead') this.pickerTitle,
    @Deprecated('should use headerBuilder instead') this.pickerDescription,
    required this.onRangeTimeSubmitPressed,
    this.onRangePickerDismissed,
    this.use24hFormat = true,
    @Deprecated('should use headerBuilder instead')
    this.titlePadding = const EdgeInsets.all(0),
    @Deprecated('should use headerBuilder instead') this.titleAlignment,
    this.dismissable = false,
    @Deprecated('should use headerBuilder instead') this.onCloseButtonPressed,
    this.bottomPickerTheme = BottomPickerTheme.blue,
    this.gradientColors,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonSingleColor,
    this.backgroundColor = Colors.white,
    this.pickerThemeData,
    @Deprecated('should use pickerThemeData instead')
    this.pickerTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    @Deprecated('should use headerBuilder instead')
    this.displayCloseIcon = true,
    @Deprecated('should use headerBuilder instead')
    this.closeIconColor = Colors.black,
    @Deprecated('should use headerBuilder instead') this.closeIconSize = 20,
    this.layoutOrientation = TextDirection.ltr,
    this.buttonAlignment = MainAxisAlignment.center,
    this.height,
    this.initialSecondTime,
    this.initialFirstTime,
    this.minFirstTime,
    this.minSecondTime,
    this.maxFirstTime,
    this.maxSecondTime,
    this.buttonContent,
    this.buttonStyle,
    this.minuteInterval = 1,
    this.showTimeSeparator = false,
    this.itemExtent = 30,
    @Deprecated('should use headerBuilder instead') this.closeWidget,
    this.closeOnSubmit = true,
    this.headerBuilder,
    this.calendarDays = CupertinoDatePickerWidget.fullWeek,
    this.diameterRatio = 1.1,
    this.useSafeArea = false,
  }) {
    datePickerMode = CupertinoDatePickerMode.time;
    bottomPickerType = BottomPickerType.rangeTime;
    dateOrder = null;
    onChange = null;
    onSubmit = null;
    onDismiss = null;
    displaySubmitButton = true;
    assert(onRangeTimeSubmitPressed != null);
    assertInitialValues();
    if (minSecondTime != null && initialSecondTime != null) {
      assert(initialSecondTime!.isAfter(minSecondTime!));
    }
    if (minFirstTime != null && initialFirstTime != null) {
      assert(initialFirstTime!.isAfter(minFirstTime!));
    }
  }

  /// Bottom picker title widget
  Widget? pickerTitle;

  /// Renders the header component of the bottom picker
  final Widget Function(BuildContext context)? headerBuilder;

  ///Bottom picker description widget
  Widget? pickerDescription;

  ///The padding applied on the title
  ///by default it is set with zero values
  EdgeInsetsGeometry? titlePadding;

  ///Title widget alignment inside the stack
  ///by default the title will be aligned left/right depends on `layoutOrientation`
  Alignment? titleAlignment;

  ///defines whether the bottom picker is dismissable or not
  ///by default it's set to false
  ///
  final bool dismissable;

  ///list of items (List of widgets) used to create simple item picker (required)
  ///and should not be empty or null
  ///
  ///for date/dateTime/time items parameter is not available
  ///
  late List<Widget>? items;

  ///Nullable function, invoked when navigating between picker items
  ///whether it's date picker or simple item picker it will return a value DateTime or int(index)
  ///
  late Function(dynamic)? onChange;

  ///Nullable function invoked  when clicking on submit button
  ///if the picker  type is date/time/dateTime it will return DateTime value
  ///else it will return the index of the selected item
  ///
  late Function(dynamic)? onSubmit;

  /// Nullable function invoked when the picker get dismissed
  /// it will return the selected value
  late Function(dynamic)? onDismiss;

  ///Invoked when clicking on the close button
  ///
  Function? onCloseButtonPressed;

  ///set the theme of the bottom picker (the button theme)
  ///possible values
  ///```
  ///{
  ///blue,
  ///orange,
  ///temptingAzure,
  ///heavyRain,
  ///plumPlate,
  ///morningSalad
  ///}
  ///```
  final BottomPickerTheme bottomPickerTheme;

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

  ///The initial time set in the time picker widget
  ///required only when using the `time` constructor
  Time? initialTime;

  /// The initial duration set for the timer picker
  /// By default it's set to null so it's `Duration.zero`
  Duration? initialTimerDuration;

  /// The time picker mode "hm", "hms" or "ms"
  /// By default it's set to "hm"
  CupertinoTimerPickerMode? timerPickerMode;

  /// The timer seconds interval
  /// Cannot be less then 1
  ///
  /// Default value is 1.
  int timerSecondsInterval = 1;

  ///The max time can be set in the time picker widget
  Time? maxTime;

  ///The min time can be set in the time picker widget
  Time? minTime;

  ///The gap between two minutes
  ///by default it's 1 minute
  int minuteInterval = 1;

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

  ///the padding that will be applied to the button
  ///if the padding is null the button will be rendered null
  final double? buttonPadding;

  ///the width that will be applied to the button
  ///if the buttonWidth is null the button will be rendered with null
  final double? buttonWidth;

  ///the bottom picker background color,
  ///by default it's white
  ///
  final Color backgroundColor;

  ///date order applied on date picker or date time picker
  ///by default it's YYYY/MM/DD
  DatePickerDateOrder? dateOrder;

  ///the picker text style applied on all types of bottom picker
  ///by default `TextStyle(fontSize: 14)`
  TextStyle? pickerTextStyle;

  /// The picker theme data
  final CupertinoTextThemeData? pickerThemeData;

  ///define the picker item extent available only for list items picker
  ///by default it's 35
  late double itemExtent;

  ///indicate whether the close icon will be rendred or not
  /// by default `displayCloseIcon = true`
  bool? displayCloseIcon;

  /// Renders the close widget if it's null and [displayCloseIcon] is true
  /// the default close icon is rendered.
  /// Note if closeWidget is provided onClosePressed won't be triggered
  /// since you need to handle all actions on the provided widget.
  Widget? closeWidget;

  ///the close icon color
  ///by default `closeIconColor = Colors.black`
  Color? closeIconColor;

  ///the close icon size
  ///by default `closeIconSize = 20`
  double? closeIconSize;

  ///the layout orientation of the bottom picker
  ///by default the orientation is set to LTR
  ///```
  ///LAYOUT_ORIENTATION.ltr,
  ///LAYOUT_ORIENTATION.rtl
  ///```
  TextDirection? layoutOrientation;

  ///THe alignment of the bottom picker button
  ///by default it's `MainAxisAlignment.center`
  final MainAxisAlignment buttonAlignment;

  ///bottom picker main widget height
  ///if it's null the bottom picker will get the height from
  ///[bottomPickerHeight] extension on context
  final double? height;

  ///invoked when pressing on the submit button when using range picker
  ///it return two dates (first date, end date)
  ///required when using [BottomPicker.range]
  late Function(DateTime, DateTime)? onRangeDateSubmitPressed;

  ///the minimum first date in the date range picker
  ///not required if null no minimum will be set in the date picker
  DateTime? minFirstDate;

  ///the minimum second date in the date range picker
  ///not required if null no minimum will be set in the date picker
  DateTime? minSecondDate;

  ///the maximum first date in the date range picker
  ///not required if null no minimum will be set in the date picker
  DateTime? maxFirstDate;

  ///the maximum second date in the date range picker
  ///not required if null no minimum will be set in the date picker
  DateTime? maxSecondDate;

  ///the initial first date in the date range picker
  ///not required if null no minimum will be set in the date picker
  DateTime? initialFirstDate;

  ///the initial last date in the date range picker
  ///not required if null no minimum will be set in the date picker
  DateTime? initialSecondDate;

  /// A widget overlaid on the picker to highlight the currently selected entry.
  /// The [selectionOverlay] widget drawn above the [CupertinoPicker]'s picker
  /// wheel.
  Widget? selectionOverlay;

  ///The button's widget that will be displayed
  ///if null the button will have a simple 'Select' text in the center
  final Widget? buttonContent;

  ///indicates if the submit button will be displayed or not
  ///by default the submit button is shown
  late bool displaySubmitButton;

  ///a single color will be applied to the button instead of the gradient
  ///themes
  ///
  final Color? buttonSingleColor;

  ///to set a custom button theme color use this list
  ///when it's not null it will be applied
  ///
  final List<Color>? gradientColors;

  /// The style that will be applied on the button's widget
  final BoxDecoration? buttonStyle;

  /// Invoked when pressing on the submit button when using range picker
  /// it return two dates (first time, end time)
  /// required when using [BottomPicker.rangeTime]
  late Function(DateTime, DateTime)? onRangeTimeSubmitPressed;

  /// Function invoked when the picker is dismissed used with range picker
  /// and time range picker.
  late Function(DateTime, DateTime)? onRangePickerDismissed;

  ///the minimum first time in the time range picker
  ///not required if null no minimum will be set in the time picker
  DateTime? minFirstTime;

  ///the minimum second time in the time range picker
  ///not required if null no minimum will be set in the time picker
  DateTime? minSecondTime;

  ///the maximum first time in the time range picker
  ///not required if null no minimum will be set in the time picker
  DateTime? maxFirstTime;

  ///the maximum second time in the time range picker
  ///not required if null no minimum will be set in the time picker
  DateTime? maxSecondTime;

  ///the initial first time in the time range picker
  ///not required if null no minimum will be set in the time picker
  DateTime? initialFirstTime;

  ///the initial last time in the time range picker
  ///not required if null no minimum will be set in the time picker
  DateTime? initialSecondTime;

  /// Indicates whether the time seperator (":") will be shown or not.
  bool showTimeSeparator = false;

  /// Indiacate whether the bottom picker will be closed (poped out of the Navigator)
  /// when the submit button is pressed.
  ///
  /// By default closeOnSubmit = true.
  bool? closeOnSubmit;

  /// The datepicker calendar type
  List<int> calendarDays = CupertinoDatePickerWidget.fullWeek;

  /// The bottom picker selector diameter ratio.
  final double diameterRatio;

  /// A predicate that can be used to select which hours are selectable.
  SelectableHourPredicate? hourPredicate;

  final bool useSafeArea;

  ///display the bottom picker popup
  ///[context] the app context to display the popup
  void show(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: useSafeArea,
      context: context,
      isDismissible: dismissable,
      enableDrag: false,
      constraints: BoxConstraints(
        maxWidth: context.bottomPickerWidth,
      ),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BottomSheet(
          backgroundColor: Colors.transparent,
          enableDrag: false,
          onClosing: () {},
          builder: (context) {
            return this;
          },
        );
      },
    );
  }

  @override
  BottomPickerState createState() => BottomPickerState();
}

class BottomPickerState extends State<BottomPicker> {
  late int selectedItemIndex;
  late DateTime selectedDateTime;

  late DateTime selectedFirstDateTime =
      widget.initialFirstDate ?? DateTime.now();
  late DateTime selectedSecondDateTime =
      widget.initialSecondDate ?? DateTime.now();

  Duration? selectedTimerDuration;

  bool disposed = false;

  @override
  void initState() {
    super.initState();
    if (widget.bottomPickerType == BottomPickerType.simple) {
      selectedItemIndex = widget.selectedItemIndex;
    } else if (widget.bottomPickerType == BottomPickerType.time) {
      selectedDateTime = (widget.initialTime ?? Time.now()).toDateTime;
    } else {
      selectedDateTime = widget.initialDateTime ?? DateTime.now();
    }

    if (kIsWeb || (!Platform.isIOS && !Platform.isAndroid)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        View.of(context).platformDispatcher.onKeyData = _onKeyPressed;
      });
    }
  }

  @override
  void dispose() {
    if (kIsWeb || (!Platform.isIOS && !Platform.isAndroid)) {
      try {
        View.of(context).platformDispatcher.onKeyData = null;
      } catch (e) {
        // ignore: avoid_print
        print('Error while removing the key event listener: $e');
      }
    }

    // invoke the onDismissed callback when the bottom picker is dismissed
    if (widget.bottomPickerType == BottomPickerType.rangeDate ||
        widget.bottomPickerType == BottomPickerType.rangeTime) {
      widget.onRangePickerDismissed?.call(
        selectedFirstDateTime,
        selectedSecondDateTime,
      );
    } else if (widget.bottomPickerType == BottomPickerType.simple) {
      widget.onDismiss?.call(selectedItemIndex);
    } else if (widget.bottomPickerType == BottomPickerType.timer) {
      widget.onDismiss?.call(selectedTimerDuration);
    } else {
      widget.onDismiss?.call(selectedDateTime);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.useSafeArea) {
      return SafeArea(
        child: _bottomPickerWidget(context),
      );
    }
    return _bottomPickerWidget(context);
  }

  Container _bottomPickerWidget(BuildContext context) {
    return Container(
      height: widget.height ?? context.bottomPickerHeight,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Directionality(
                textDirection: widget.layoutOrientation ?? TextDirection.ltr,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: widget.headerBuilder == null
                          ? widget.titlePadding ?? const EdgeInsets.all(0)
                          : EdgeInsets.zero,
                      child: Row(
                        children: [
                          if (widget.headerBuilder != null)
                            Expanded(
                              child: widget.headerBuilder!(
                                context,
                              ),
                            ),
                          if (widget.headerBuilder == null &&
                              widget.pickerTitle != null)
                            Expanded(child: widget.pickerTitle!),
                          if (widget.headerBuilder == null &&
                              (widget.displayCloseIcon ?? true))
                            widget.closeWidget ??
                                CloseIcon(
                                  onPress: _closeBottomPicker,
                                  iconColor: widget.closeIconColor,
                                  closeIconSize: widget.closeIconSize,
                                ),
                        ],
                      ),
                    ),
                    if (widget.headerBuilder == null &&
                        widget.pickerDescription != null)
                      widget.pickerDescription!,
                  ],
                ),
              ),
            ),
            Expanded(
              child: widget.bottomPickerType == BottomPickerType.simple
                  ? SimplePicker(
                      items: widget.items!,
                      onChange: (int index) {
                        selectedItemIndex = index;
                        widget.onChange?.call(index);
                      },
                      selectedItemIndex: widget.selectedItemIndex,
                      textStyle: widget.pickerTextStyle,
                      itemExtent: widget.itemExtent,
                      selectionOverlay: widget.selectionOverlay,
                      pickerThemeData: widget.pickerThemeData,
                      diameterRatio: widget.diameterRatio,
                    )
                  : widget.bottomPickerType == BottomPickerType.timer
                      ? TimePicker(
                          mode: widget.timerPickerMode!,
                          minuteInterval: widget.minuteInterval,
                          textStyle: widget.pickerTextStyle,
                          itemExtent: widget.itemExtent,
                          initialDuration: widget.initialTimerDuration,
                          onChange: (p0) {
                            widget.onChange?.call(p0);
                            selectedTimerDuration = p0;
                          },
                          secondInterval: widget.timerSecondsInterval,
                          pickerThemeData: widget.pickerThemeData,
                        )
                      : widget.bottomPickerType == BottomPickerType.time
                          ? DatePicker(
                              initialDateTime: widget.initialTime.toDateTime,
                              minuteInterval: widget.minuteInterval,
                              maxDateTime: widget.maxTime.toDateTime,
                              minDateTime: widget.minTime.toDateTime,
                              mode: widget.datePickerMode,
                              onDateChanged: (DateTime date) {
                                selectedDateTime = date;
                                widget.onChange?.call(date);
                              },
                              use24hFormat: widget.use24hFormat,
                              dateOrder: widget.dateOrder,
                              textStyle: widget.pickerTextStyle,
                              itemExtent: widget.itemExtent,
                              showTimeSeparator: widget.showTimeSeparator,
                              pickerThemeData: widget.pickerThemeData,
                            )
                          : widget.bottomPickerType == BottomPickerType.dateTime
                              ? DatePicker(
                                  initialDateTime: widget.initialDateTime,
                                  minuteInterval: widget.minuteInterval,
                                  maxDateTime: widget.maxDateTime,
                                  minDateTime: widget.minDateTime,
                                  mode: widget.datePickerMode,
                                  onDateChanged: (DateTime date) {
                                    selectedDateTime = date;
                                    widget.onChange?.call(date);
                                  },
                                  use24hFormat: widget.use24hFormat,
                                  dateOrder: widget.dateOrder,
                                  textStyle: widget.pickerTextStyle,
                                  itemExtent: widget.itemExtent,
                                  showTimeSeparator: widget.showTimeSeparator,
                                  pickerThemeData: widget.pickerThemeData,
                                  hourPredicate: widget.hourPredicate,
                                )
                              : widget.bottomPickerType == BottomPickerType.year
                                  ? BottomYearDatePicker(
                                      initialDateTime: widget.initialDateTime,
                                      maxDateTime: widget.maxDateTime,
                                      minDateTime: widget.minDateTime,
                                      onDateChanged: (DateTime date) {
                                        selectedDateTime = date;
                                        widget.onChange?.call(date);
                                      },
                                      itemExtent: widget.itemExtent,
                                      pickerThemeData: widget.pickerThemeData,
                                    )
                                  : widget.bottomPickerType ==
                                          BottomPickerType.rangeTime
                                      ? RangePicker(
                                          mode: CupertinoDatePickerMode.time,
                                          use24hFormat: widget.use24hFormat,
                                          initialFirstDateTime:
                                              widget.initialFirstTime,
                                          initialSecondDateTime:
                                              widget.initialSecondTime,
                                          maxFirstDate: widget.maxFirstTime,
                                          minFirstDateTime: widget.minFirstTime,
                                          maxSecondDate: widget.maxSecondTime,
                                          minSecondDateTime:
                                              widget.minSecondTime,
                                          onFirstDateChanged: (DateTime date) {
                                            selectedFirstDateTime = date;
                                          },
                                          onSecondDateChanged: (DateTime date) {
                                            selectedSecondDateTime = date;
                                          },
                                          dateOrder: widget.dateOrder,
                                          textStyle: widget.pickerTextStyle,
                                          minuteInterval: widget.minuteInterval,
                                          itemExtent: widget.itemExtent,
                                          showTimeSeperator:
                                              widget.showTimeSeparator,
                                          pickerThemeData:
                                              widget.pickerThemeData,
                                        )
                                      : RangePicker(
                                          mode: CupertinoDatePickerMode.date,
                                          use24hFormat: widget.use24hFormat,
                                          initialFirstDateTime:
                                              widget.initialFirstDate,
                                          initialSecondDateTime:
                                              widget.initialSecondDate,
                                          maxFirstDate: widget.maxFirstDate,
                                          minFirstDateTime: widget.minFirstDate,
                                          maxSecondDate: widget.maxSecondDate,
                                          minSecondDateTime:
                                              widget.minSecondDate,
                                          onFirstDateChanged: (DateTime date) {
                                            selectedFirstDateTime = date;
                                          },
                                          onSecondDateChanged: (DateTime date) {
                                            selectedSecondDateTime = date;
                                          },
                                          dateOrder: widget.dateOrder,
                                          textStyle: widget.pickerTextStyle,
                                          itemExtent: widget.itemExtent,
                                          showTimeSeperator:
                                              widget.showTimeSeparator,
                                          pickerThemeData:
                                              widget.pickerThemeData,
                                        ),
            ),
            if (widget.displaySubmitButton)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: widget.buttonAlignment,
                  children: [
                    BottomPickerButton(
                      onClick: () {
                        if (widget.bottomPickerType ==
                            BottomPickerType.rangeDate) {
                          widget.onRangeDateSubmitPressed?.call(
                            selectedFirstDateTime,
                            selectedSecondDateTime,
                          );
                        } else if (widget.bottomPickerType ==
                            BottomPickerType.rangeTime) {
                          widget.onRangeTimeSubmitPressed?.call(
                            selectedFirstDateTime,
                            selectedSecondDateTime,
                          );
                        } else if (widget.bottomPickerType ==
                                BottomPickerType.dateTime ||
                            widget.bottomPickerType == BottomPickerType.time ||
                            widget.bottomPickerType == BottomPickerType.year) {
                          widget.onSubmit?.call(selectedDateTime);
                        } else if (widget.bottomPickerType ==
                            BottomPickerType.timer) {
                          widget.onSubmit?.call(selectedTimerDuration);
                        } else {
                          widget.onSubmit?.call(selectedItemIndex);
                        }

                        if (widget.closeOnSubmit ?? false) {
                          Navigator.pop(context);
                        }
                      },
                      gradients: widget.gradientColors,
                      theme: widget.bottomPickerTheme,
                      buttonPadding: widget.buttonPadding,
                      buttonWidth: widget.buttonWidth,
                      solidColor: widget.buttonSingleColor,
                      buttonChild: widget.buttonContent,
                      style: widget.buttonStyle,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Handle the key press event
  bool _onKeyPressed(KeyData keyData) {
    if (keyData.logical == LogicalKeyboardKey.escape.keyId &&
        !disposed &&
        widget.dismissable) {
      disposed = true;
      Navigator.pop(context);
      return disposed;
    }
    return false;
  }

  /// Close the bottom picker
  void _closeBottomPicker() {
    widget.onCloseButtonPressed?.call();
    Navigator.pop(context);
  }
}
