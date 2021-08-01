
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
	bottom_picker: 1.0.0
```

##  Parameters


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