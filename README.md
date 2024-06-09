# Bottom Picker

<p  align="center">
<img  src="https://github.com/koukibadr/Bottom-Picker/blob/main/example/bottom_picker_logo.gif?raw=true"/>
<br>
<b>Easy way to display bottom picker item or date/time picker</b>
</p>

| ![simple item picker.png](https://github.com/koukibadr/Bottom-Picker/blob/main/example/simple%20item%20picker.png?raw=true)    | ![date_time picker.png](https://github.com/koukibadr/Bottom-Picker/blob/main/example/date_time%20picker.png?raw=true)   |
| ------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| ![time picker.png](https://github.com/koukibadr/Bottom-Picker/blob/main/example/time%20picker.png?raw=true)                    | ![date picker.png](https://github.com/koukibadr/Bottom-Picker/blob/main/example/date%20picker.png?raw=true)             |
| ![enter image description here](https://github.com/koukibadr/Bottom-Picker/blob/main/example/range_picker_arabic.png?raw=true) | ![enter image description here](https://github.com/koukibadr/Bottom-Picker/blob/main/example/range_picker.png?raw=true) |

## Features

- Simple list picker wheel
- Date range picker (RTL and LTR)
- Date picker
- Time picker
- Date and Time picker
- 24h / 12h time format
- Built-in themes
- Customize confirm button
- Customize first selected item
- Enhanced tablet view
- Customize background color
- Customize date format order
- Customize picker text style (color, font size, font weight...)
- Customize close button style and display
- Customize layout orientation (LTR / RTL )
- Customizable bottom picker height
- Customizable minuteInterval attribute

## Getting Started

To add bottom picker to your project add this line to your pubspec.yaml file

```yaml
dependencies:
	bottom_picker: ^2.8.0
```

## Parameters

````dart
	///Bottom picker title widget
  final Widget? pickerTitle;

  ///Bottom picker description widget
  final Widget? pickerDescription;

  ///The padding applied on the title
  ///by default it is set with zero values
  final EdgeInsetsGeometry titlePadding;

  ///Title widget alignment inside the stack
  ///by default the title will be aligned left/right depends on `layoutOrientation`
  final Alignment? titleAlignment;

  ///defines whether the bottom picker is dismissable or not
  ///by default it's set to false
  ///
  final bool dismissable;

  ///list of items (List of text) used to create simple item picker (required)
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

  ///Invoked when clicking on the close button
  ///
  final Function? onClose;

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

  ///The max time can be set in the time picker widget
  Time? maxTime;

  ///The min time can be set in the time picker widget
  Time? minTime;

  ///The gap between two minutes
  ///by default it's 1 minute
  int? minuteInterval;

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
  late DatePickerDateOrder? dateOrder;

  ///the picker text style applied on all types of bottom picker
  ///by default `TextStyle(fontSize: 14)`
  final TextStyle pickerTextStyle;

  ///define the picker item extent available only for list items picker
  ///by default it's 35
  late double itemExtent;

  ///indicate whether the close icon will be rendred or not
  /// by default `displayCloseIcon = true`
  final bool displayCloseIcon;

  ///the close icon color
  ///by default `closeIconColor = Colors.black`
  final Color closeIconColor;

  ///the close icon size
  ///by default `closeIconSize = 20`
  final double closeIconSize;

  ///the layout orientation of the bottom picker
  ///by default the orientation is set to LTR
  ///```
  ///LAYOUT_ORIENTATION.ltr,
  ///LAYOUT_ORIENTATION.rtl
  ///```
  final LayoutOrientation layoutOrientation;

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

  ///the style that will be applied on the button's widget
  final BoxDecoration? buttonStyle;
````

<hr/>

**Migrate from 2.3.3 to 2.4.0:** `iconColor` , `buttonText` , `buttonTextStyle`, `displayButtonIcon`, `buttonTextAlignment` has been replaced with `buttonContent`, `buttonStyle` attributes to see the new attributes usage check the latest example in this documentation

<hr/>
## Examples

Simple item picker

```dart
BottomPicker(
	items: items,
	title:  Text("Choose your country", style: TextStyle(fontWeight:  FontWeight.bold, fontSize:  15)),
).show(context);
```

<hr>

Date picker

```dart
BottomPicker.date(
	pickerTitle: Text(
        'Set your Birthday',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.blue,
        ),
      ),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(1996, 10, 22),
      maxDateTime: DateTime(1998),
      minDateTime: DateTime(1980),
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
).show(context);

```

<hr>

Time picker

```dart

BottomPicker.time(
      pickerTitle: Text(
        'Set your next meeting time',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.orange,
        ),
      ),
      onSubmit: (index) {
        print(index);
      },
      onClose: () {
        print('Picker closed');
      },
      bottomPickerTheme: BottomPickerTheme.orange,
      use24hFormat: true,
      initialTime: Time(
        minutes: 23,
      ),
      maxTime: Time(
        hours: 17,
      ),
  ).show(context);



```

<hr>

Date & Time picker

```dart
BottomPicker.dateTime(
	pickerTitle: Text(
        'Set the event exact time and date',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      onSubmit: (date) {
        print(date);
      },
      onClose: () {
        print('Picker closed');
      },
      minDateTime: DateTime(2021, 5, 1),
      maxDateTime: DateTime(2021, 8, 2),
      initialDateTime: DateTime(2021, 5, 1),
      gradientColors: [
        Color(0xfffdcbf1),
        Color(0xffe6dee9),
      ],
).show(context);
```

<hr>

With custom picker text style

```dart
BottomPicker(
	items: [
        Center(
          child: Text('Leonardo DiCaprio'),
        ),
        Center(
          child: Text('Johnny Depp'),
        ),
        Center(
          child: Text('Robert De Niro'),
        ),
        Center(
          child: Text('Tom Hardy'),
        ),
        Center(
          child: Text('Ben Affleck'),
        ),
      ],
      pickerTitle: Text('Choose an actor'),
      titleAlignment: Alignment.center,
      pickerTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      closeIconColor: Colors.red,
).show(context);


```

<p  align="center">

<img  src="https://github.com/koukibadr/Bottom-Picker/blob/main/example/bottom_picker_custom_picker_text_style.png?raw=true"  width="200"/>

</p>

<hr>
Range date picker

```dart
BottomPicker.range(
	 pickerTitle: Text(
        'Set date range',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      pickerDescription: Text(
        'Please select a first date and an end date',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      dateOrder: DatePickerDateOrder.dmy,
      minFirstDate: DateTime.now(),
      initialFirstDate: DateTime.now().add(Duration(days: 1)),
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onRangeDateSubmitPressed: (firstDate, secondDate) {
        print(firstDate);
        print(secondDate);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
).show(context);


```

<p  align="center">
<img  src="https://github.com/koukibadr/Bottom-Picker/blob/main/example/range_picker.png?raw=true"  width="200"/>

</p>

## Contribution

You can contribute to it [https://github.com/koukibadr/Bottom-Picker](https://github.com/koukibadr/Bottom-Picker)

- If you **finda bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit your pull request.

## Contributors

<a  href  =  "https://github.com/koukibadr/Bottom-Picker/graphs/contributors">
<img  src  =  "https://contrib.rocks/image?repo=koukibadr/Bottom-Picker"/>
</a>
