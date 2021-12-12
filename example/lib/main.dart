// ignore_for_file: avoid_print

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        body: ExampleApp(),
      ),
    );
  }
}

class ExampleApp extends StatelessWidget {
  final countryList = [
    Text('Algeria 🇩🇿'),
    Text('Maroco 🇲🇦'),
    Text('Tunisia 🇹🇳'),
    Text('Palestine 🇵🇸'),
    Text('Egypt 🇪🇬'),
    Text('Syria 🇸🇾'),
    Text('Irak 🇮🇶'),
    Text('Mauritania 🇲🇷')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF6F2F2),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://github.com/koukibadr/Bottom-Picker/blob/main/example/bottom_picker_logo.gif?raw=true',
            width: 200,
          ),
          ElevatedButton(
            onPressed: () {
              _openSimpleItemPicker(context, countryList);
            },
            child: Text('Simple Item picker'),
          ),
          ElevatedButton(
            onPressed: () {
              _openSecondSimpleItemPicker(context, countryList);
            },
            child: Text('Simple Item picker with different theme'),
          ),
          ElevatedButton(
            onPressed: () {
              _openDatePicker(context);
            },
            child: Text('Date Picker'),
          ),
          ElevatedButton(
            onPressed: () {
              _openTimePicker(context);
            },
            child: Text('Time Picker'),
          ),
          ElevatedButton(
            onPressed: () {
              _openDateTimePicker(context);
            },
            child: Text('Date and Time Picker'),
          ),
          ElevatedButton(
            onPressed: () {
              _openDateTimePickerWithCustomButton(context);
            },
            child: Text('Bottom picker with custom button'),
          ),
        ],
      ),
    );
  }

  void _openSimpleItemPicker(BuildContext context, List<Text> items) {
    BottomPicker(
      items: items,
      title: 'Choose your country',
      titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      backgroundColor: Colors.white.withOpacity(0.8),
      onSubmit: (index) {
        print(index);
      },
    ).show(context);
  }

  void _openSecondSimpleItemPicker(BuildContext context, List<Text> items) {
    BottomPicker(
      items: items,
      selectedItemIndex: 1,
      title: 'Choose your country',
      titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
      },
      bottomPickerTheme: BOTTOM_PICKER_THEME.morningSalad,
    ).show(context);
  }

  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      title: 'Set your Birthday',
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
      bottomPickerTheme: BOTTOM_PICKER_THEME.plumPlate,
    ).show(context);
  }

  void _openTimePicker(BuildContext context) {
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
      bottomPickerTheme: BOTTOM_PICKER_THEME.orange,
      use24hFormat: true,
    ).show(context);
  }

  void _openDateTimePicker(BuildContext context) {
    BottomPicker.dateTime(
      title: 'Set the event exact time and date',
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      onSubmit: (date) {
        print(date);
      },
      onClose: () {
        print('Picker closed');
      },
      iconColor: Colors.black,
      minDateTime: DateTime(2021, 5, 1),
      maxDateTime: DateTime(2021, 8, 2),
      initialDateTime: DateTime(2021, 5, 1),
      gradientColors: [Color(0xfffdcbf1), Color(0xffe6dee9)],
    ).show(context);
  }

  void _openDateTimePickerWithCustomButton(BuildContext context) {
    BottomPicker.dateTime(
      title: 'Set the event exact time and date',
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      onSubmit: (date) {
        print(date);
      },
      onClose: () {
        print('Picker closed');
      },
      buttonText: 'Confirm',
      buttonTextStyle: const TextStyle(color: Colors.white),
      buttonSingleColor: Colors.pink,
      iconColor: Colors.black,
      minDateTime: DateTime(2021, 5, 1),
      maxDateTime: DateTime(2021, 8, 2),
      gradientColors: [Color(0xfffdcbf1), Color(0xffe6dee9)],
    ).show(context);
  }
}
