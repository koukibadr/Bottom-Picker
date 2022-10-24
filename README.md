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
- Customize button alignment
- Customizable bottom picker height
- Customizable button display and visibility
- Customizable minuteInterval attribute

## Getting Started

To add bottom picker to your project add this line to your pubspec.yaml file

```yaml
dependencies:
	bottom_picker: ^2.0.1
```

## Parameters

```dart
///The title of the bottom picker
///it's required for all bottom picker types
final  String  title;

///The description of the bottom picker (displayed below the text)
///by default it's an empty text
final  String  description;

///The text style applied on the title
///by default it applies simple text style
final  TextStyle  titleStyle;

///The text style applied on the description
///by default it applies simple text style
final  TextStyle  descriptionStyle;

///defines whether the bottom picker is dismissable or not
///by default it's set to false
final  bool  dismissable;

///list of items (List of text) used to create simple item picker (required)
///and should not be empty or null
///for date/dateTime/time items parameter is not available
late  List<Text>?  items;

///Nullable function, invoked when navigating between picker items
///whether it's date picker or simple item picker it will return a value DateTime or int(index)
late  Function(dynamic)?  onChange;

///Nullable function invoked when clicking on submit button
///if the picker type is date/time/dateTime it will return DateTime value
///else it will return the index of the selected item
late  Function(dynamic)?  onSubmit;

///Invoked when clicking on the close button
final  Function?  onClose;

///set the theme of the bottom picker (the button theme)
///possible values
///{
///blue,
///orange,
///temptingAzure,
///heavyRain,
///plumPlate,
///morningSalad
///}
final  BottomPickerTheme  bottomPickerTheme;

///to set a custom button theme color use this list
///when it's not null it will be applied
final  List<Color>?  gradientColors;

///define the icon color on the button
///by default it's White
final  Color  iconColor;

///used for simple bottom picker
///by default it's 0, needs to be in the range [0, this.items.length-1]
///otherwise an exception will be thrown
///for date and time picker type this parameter is not available
late  int  selectedItemIndex;

///The initial date time applied on the date and time picker
///by default it's null
DateTime?  initialDateTime;

///The gap between two minutes
///by default it's 1 minute
int?  minuteInterval;

///the max date time on the date picker
///by default it's null
DateTime?  maxDateTime;

///the minimum date & time applied on the date picker
///by default it's null
DateTime?  minDateTime;

///define whether the time uses 24h or 12h format
///by default it's false (12h format)
late  bool  use24hFormat;

///the text that will be applied to the button
///if the text is null the button will be rendered with an icon
final  String?  buttonText;

///the button text style, will be applied on the button's text
final  TextStyle?  buttonTextStyle;

///display button icon
///by default it's true
///if you want to display a text you can set [displayButtonIcon] to false
final  bool  displayButtonIcon;

///a single color will be applied to the button instead of the gradient
///themes
final  Color?  buttonSingleColor;

///the bottom picker background color,
///by default it's white
final  Color  backgroundColor;

///date order applied on date picker or date time picker
///by default it's YYYY/MM/DD
late  DatePickerDateOrder?  dateOrder;

///the picker text style applied on all types of bottom picker
///by default `TextStyle(fontSize: 14)`
final  TextStyle  pickerTextStyle;

///define the picker item extent available only for list items picker
///by default it's 35
late  double  itemExtent;

///indicate whether the close icon will be rendred or not
/// by default `displayCloseIcon = true`
final  bool  displayCloseIcon;

///the close icon color
///by default `closeIconColor = Colors.black`
final  Color  closeIconColor;

///the layout orientation of the bottom picker
///by default the orientation is set to LTR
///LAYOUT_ORIENTATION.ltr,
///LAYOUT_ORIENTATION.rtl
final  LayoutOrientation  layoutOrientation;

///THe alignement of the bottom picker button
///by default it's `MainAxisAlignment.center`
final  MainAxisAlignment  buttonAlignement;

///bottom picker main widget height
///if it's null the bottom picker will get the height from
///[bottomPickerHeight] extension on context
final  double?  height;

///indicates if the submit button will be displayed or not
///by default the submit button is shown
late  bool  displaySubmitButton;

///invoked when pressing on the submit button when using range picker
///it return two dates (first date, end date)
///required when using [BottomPicker.range]
late  Function(DateTime, DateTime)?  onSubmitPressed;

///the minimum first date in the date range picker
///not required if null no minimum will be set in the date picker
DateTime?  minFirstDate;

///the minimum second date in the date range picker
///not required if null no minimum will be set in the date picker
DateTime?  minSecondDate;

///the maximum first date in the date range picker
///not required if null no minimum will be set in the date picker
DateTime?  maxFirstDate;

///the maximum second date in the date range picker
///not required if null no minimum will be set in the date picker
DateTime?  maxSecondDate;

///the initial first date in the date range picker
///not required if null no minimum will be set in the date picker
DateTime?  initialFirstDate;

///the initial last date in the date range picker
///not required if null no minimum will be set in the date picker
DateTime?  initialSecondDate;
```

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
	title:  "Set your next meeting time",
	titleStyle:  TextStyle(
		fontWeight:  FontWeight.bold,
		fontSize:  15,
		color:  Colors.orange
	),
	onSubmit: (index) {
		print(index);
	},
	onClose: () {
		print("Picker closed");
	},
	bottomPickerTheme:  BOTTOM_PICKER_THEME.orange,
	use24hFormat:  true
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
	iconColor:  Colors.black,
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
	buttonTextStyle:  const  TextStyle(
		color:  Colors.white
	),
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

## Contribution

You can contribute to it [https://github.com/koukibadr/Bottom-Picker](https://github.com/koukibadr/Bottom-Picker)

- If you **finda bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit your pull request.

## Contributors

<a  href  =  "https://github.com/koukibadr/Bottom-Picker/graphs/contributors">
<img  src  =  "https://contrib.rocks/image?repo=koukibadr/Bottom-Picker"/>
</a>
