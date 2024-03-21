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
	bottom_picker: ^2.5.0
```

## Parameters

```dart
	///The title of the bottom picker
  ///it's required for all bottom picker types
  final String title;

  ///The description of the bottom picker (displayed below the text)
  ///by default it's an empty text
  final String description;

  ///The text style applied on the title
  ///by default it applies simple text style
  final TextStyle titleStyle;

  ///The padding applied on the title
  ///by default it is set with zero values
  final EdgeInsetsGeometry titlePadding;

  ///Title and description alignment
  ///The default value is `MainAxisAlignment.center`
  final CrossAxisAlignment titleAlignment;

  ///The text style applied on the description
  ///by default it applies simple text style
  final TextStyle descriptionStyle;

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

  ///Permits to not call `Navigator.pop(context)` when clicking on the close button only if [onClose] is not null.
  ///If [onClose] is null, the close button will always call pop.
  ///By default `popOnClose = true`
  final bool popOnClose;

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
```
<hr/>

**Migrate from 2.3.3 to 2.4.0:** `iconColor` , `buttonText` , `buttonTextStyle`, `displayButtonIcon`, `buttonTextAlignment` has been replaced with `buttonContent`, `buttonStyle` attributes to see the new attributes usage check the latest example in this documentation

<hr/>
## Examples

Simple item picker

```dart

BottomPicker(
	items: items,
	title:  "Choose your country",
	titleStyle:  TextStyle(fontWeight:  FontWeight.bold, fontSize:  15)
).show(context);
```

<hr>

Date picker

```dart

BottomPicker.date(
	title:  "Set your Birthday",
	titleStyle:  TextStyle(
		fontWeight:  FontWeight.bold,
		fontSize:  15,
		color:  Colors.blue
	),
	onChange: (index) {
		print(index);
	},
	onSubmit: (index) {
		print(index);
	},
	bottomPickerTheme:  BOTTOM_PICKER_THEME.plumPlate
).show(context);

```

<hr>

Time picker

```dart

BottomPicker.time(
      title: 'Set your next meeting time',
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.orange,
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
	title:  'Set the event exact time and date',
	titleStyle:  TextStyle(
		fontWeight:  FontWeight.bold,
		fontSize:  15,
		color:  Colors.black,
	),
	onSubmit: (date) {
		print(date);
	},
	onClose: () {
		print('Picker closed');
	},
	minDateTime:  DateTime(2021, 5, 1),
	maxDateTime:  DateTime(2021, 8, 2),
	initialDateTime:  DateTime(2021, 5, 1),
	gradientColors: [Color(0xfffdcbf1), Color(0xffe6dee9)],
).show(context);
```

<hr>

With custom button design

```dart

BottomPicker.dateTime(
	title:  "Set the event exact time and date",
	titleStyle:  TextStyle(
		fontWeight:  FontWeight.bold,
		fontSize:  15,
		color:  Colors.black
	),
	onSubmit: (date) {
		print(date);
	},
	onClose: () {
		print("Picker closed");
	},
	buttonText:  'Confirm',
	buttonSingleColor:  Colors.pink,
	minDateTime:  DateTime(2021, 5, 1),
	maxDateTime:  DateTime(2021, 8, 2),
).show(context);



```

<hr>

With custom background

```dart

BottomPicker(
	items: items,
	title:  'Choose your country',
	titleStyle:  TextStyle(fontWeight:  FontWeight.bold, fontSize:  15),
	backgroundColor:  Colors.yellow.withOpacity(0.6),
	bottomPickerTheme:  BOTTOM_PICKER_THEME.morningSalad,
	onSubmit: (index) {
		print(index);
	},
).show(context);



```

<p  align="center">

<img  src="https://github.com/koukibadr/Bottom-Picker/blob/main/example/bottom_picker_custom_background.png?raw=true"  width="200"/>

</p>

<hr>

With custom picker text style

```dart
BottomPicker(
	items: [
		Text('Leonardo DiCaprio'),
		Text('Johnny Depp'),
		Text('Robert De Niro'),
		Text('Tom Hardy'),
		Text('Ben Affleck'),
	],
	title:  'Select the actor',
	pickerTextStyle:  TextStyle(
		color:  Colors.blue,
		fontSize:  12,
		fontWeight:  FontWeight.bold,
	),
).show(context);


```

<p  align="center">

<img  src="https://github.com/koukibadr/Bottom-Picker/blob/main/example/bottom_picker_custom_picker_text_style.png?raw=true"  width="200"/>

</p>

<hr>
With custom close button style

```dart
BottomPicker(
	items: [
		Text('Leonardo DiCaprio'),
		Text('Johnny Depp'),
		Text('Robert De Niro'),
		Text('Tom Hardy'),
		Text('Ben Affleck'),
	],
	title:  'Select the actor',
	pickerTextStyle:  TextStyle(
		color:  Colors.blue,
		fontSize:  12,
		fontWeight:  FontWeight.bold,
	),
	closeIconColor:  Colors.red
).show(context);


```

<hr>
Range date picker

```dart
BottomPicker.range(
	title:  'Set date range',
	description:  'Please select a first date and an end date',
	dateOrder:  DatePickerDateOrder.dmy,
	minFirstDate:  DateTime.now(),
	minSecondDate:  DateTime.now().add(const  Duration(days:  1)),
	pickerTextStyle:  TextStyle(
		color:  Colors.blue,
		fontWeight:  FontWeight.bold,
		fontSize:  12,
	),
	titleStyle:  TextStyle(
		fontWeight:  FontWeight.bold,
		fontSize:  15,
		color:  Colors.black,
	),
	descriptionStyle:  TextStyle(
		color:  Colors.black,
	),
	onSubmitPressed: (firstDate, secondDate) {
		print(firstDate);
		print(secondDate);
	},
	bottomPickerTheme:  BottomPickerTheme.plumPlate,
).show(context);


```

<p  align="center">
<img  src="https://github.com/koukibadr/Bottom-Picker/blob/main/example/range_picker.png?raw=true"  width="200"/>

</p>


<hr>
Custom button style

```dart
BottomPicker.date(
    title: 'Set your Birthday',
    dateOrder: DatePickerDateOrder.dmy,
    initialDateTime: DateTime(1996, 10, 22),
    maxDateTime: DateTime(1998),
    minDateTime: DateTime(1980),
    pickerTextStyle: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
    titleStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.blue,
    ),
    onChange: (index) {
      print(index);
    },
    onSubmit: (index) {
      print(index);
    },
    bottomPickerTheme: BottomPickerTheme.plumPlate,
    buttonStyle: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.blue[200]!,
      ),
    ),
    buttonWidth: 200,
    buttonContent: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Select date',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 15,
          )
        ],
      ),
    ),
  ).show(context);


```

<p  align="center">
<img  src="https://github.com/koukibadr/Bottom-Picker/blob/main/example/bottom_picker_with_button_style.png?raw=true"  width="200"/>

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
