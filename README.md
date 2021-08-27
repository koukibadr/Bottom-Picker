
#  Bottom Picker

<p  align="center">
	<img  src="https://github.com/koukibadr/Bottom-Picker/blob/main/example/bottom_picker_logo.gif?raw=true"/>
	<br>
	<b>Easy way to display bottom picker item or date/time picker</b>
</p>

  
| ![simple item picker.png](https://github.com/koukibadr/Bottom-Picker/blob/main/example/simple%20item%20picker.png?raw=true) | ![date_time picker.png](https://github.com/koukibadr/Bottom-Picker/blob/main/example/date_time%20picker.png?raw=true) |
|--|--|
| ![time picker.png](https://github.com/koukibadr/Bottom-Picker/blob/main/example/time%20picker.png?raw=true) | ![date picker.png](https://github.com/koukibadr/Bottom-Picker/blob/main/example/date%20picker.png?raw=true) |


##  Features
- Simple list picker wheel
- Date picker 
- Time picker
- Date and Time picker
- 24h / 12h time format
- Built-in themes

##  Getting Started

To add bottom picker to your project add this line to your pubspec.yaml file
```yaml
dependencies:
	bottom_picker: 1.0.2
```

##  Parameters

```dart
///The title of the bottom picker
///it's required for all bottom picker types
final  String title;


///The text style applied on the title
///by default it applies simple text style
final  TextStyle titleStyle;


///defines whether the bottom picker is dismissable or not
///by default it's set to false
final  bool dismissable;


///list of items (List of text) used to create simple item picker (required)
///and should not be empty or null
///for date/dateTime/time items parameter is not available
late  List<Text>? items;

  

///Nullable function, invoked when navigating between picker items
///whether it's date picker or simple item picker it will return a value DateTime or int(index)
final  Function(dynamic)? onChange;



///Nullable function invoked when clicking on submit button
///if the picker type is date/time/dateTime it will return DateTime value
///else it will return the index of the selected item

final  Function(dynamic)? onSubmit;


///Invoked when clicking on the close button
final  Function? onClose;

  

///set the theme of the bottom picker (the button theme)
///possible values
///BLUE,
///ORANGE,
///TEMPTING_AZURE,
///HEAVY_RAIN,
///PLUM_PLATE,
///MORNING_SALAD
final  BOTTOM_PICKER_THEME bottomPickerTheme;

  

///to set a custom button theme color use this list
///when it's not null it will be applied
final  List<Color>? gradientColors;


///define the icon color on the button
///by default it's White
final  Color iconColor;


///used for simple bottom picker
///by default it's 0, needs to be in the range [0, this.items.length-1]
///otherwise an exception will be thrown
///for date and time picker type this parameter is not available
int selectedItemIndex;


///The initial date time applied on the date and time picker
///by default it's null
DateTime? initialDateTime;


///the max date time on the date picker
///by default it's null
DateTime? maxDateTime;


///the minimum date & time applied on the date picker
///by default it's null
DateTime? minDateTime;

  

///define whether the time uses 24h or 12h format
///by default it's false (12h format)
bool use24hFormat;
```


##  Examples

Simple item picker
```dart
BottomPicker(
	items: items,
	title:  "Choose your country",
	titleStyle:  TextStyle(fontWeight:  FontWeight.bold, fontSize:  15))
.show(context);
```
<hr>

Date picker
```dart
BottomPicker.date(
	title:  "Set your Birthday",
	titleStyle:  TextStyle(fontWeight:  FontWeight.bold, fontSize:  15, color:  Colors.blue),
	onChange: (index) {
		print(index);
	},
	onSubmit: (index) {
		print(index);
	},
	bottomPickerTheme:  BOTTOM_PICKER_THEME.PLUM_PLATE)
.show(context);
```
<hr>

Time picker
```dart
BottomPicker.time(
	title:  "Set your next meeting time",
	titleStyle:  TextStyle(fontWeight:  FontWeight.bold,fontSize:  15,color:  Colors.orange),
	onSubmit: (index) {
		print(index);
	},
	onClose: () {
		print("Picker closed");
	},
	bottomPickerTheme:  BOTTOM_PICKER_THEME.ORANGE,
	use24hFormat:  true)
.show(context);
```

<hr>

Date & Time picker
```dart
BottomPicker.dateTime(
	title:  "Set the event exact time and date",
	titleStyle:  TextStyle(fontWeight:  FontWeight.bold,fontSize:  15,color:  Colors.black),
	onSubmit: (index) {
		print(index);
	},
	onClose: () {
		print("Picker closed");
	},
	iconColor:  Colors.black,
	minDateTime:  DateTime(2021,7,1),
	maxDateTime:  DateTime(2021,8,2),
	gradientColors: [Color(0xfffdcbf1),Color(0xffe6dee9)])
.show(context);
```
##  Contribution

You can contribute to it [https://github.com/koukibadr/Bottom-Picker](https://github.com/koukibadr/Bottom-Picker)
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.