// ignore_for_file: avoid_print

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/cupertino/cupertino_date_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      home: Scaffold(
        body: ExampleApp(),
      ),
    );
  }
}

class ExampleApp extends StatelessWidget {
  final countryList = [
    Center(
      child: Text('Algeria 🇩🇿'),
    ),
    Center(
      child: Text('Maroco 🇲🇦'),
    ),
    Center(
      child: Text('Tunisia 🇹🇳'),
    ),
    Center(
      child: Text('Palestine 🇵🇸'),
    ),
    Center(
      child: Text('Egypt 🇪🇬'),
    ),
    Center(
      child: Text('Syria 🇸🇾'),
    ),
    Center(
      child: Text('Irak 🇮🇶'),
    ),
    Center(
      child: Text('Mauritania 🇲🇷'),
    ),
  ];

  final buttonWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF6F2F2),
      width: double.infinity,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openSimpleItemPicker(context, countryList);
              },
              child: Text(
                'Simple Item picker',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openSecondSimpleItemPicker(context, countryList);
              },
              child: Text(
                'Simple Item picker with different theme',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openYearDatePicker(context);
              },
              child: Text('Year Picker', textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openDatePicker(context);
              },
              child: Text('Date Picker', textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openDatePickerWithButtonStyle(context);
              },
              child: Text(
                'Date Picker with button style',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openMonthYearPicker(context);
              },
              child: Text('Month Year Picker'),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openRangeDatePicker(context);
              },
              child: Text('Range Date Picker', textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openRangeTimePicker(context);
              },
              child: Text('Range Time Picker'),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openTimePicker(context);
              },
              child: Text('Time Picker', textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openTimerPicker(context);
              },
              child: Text('Countdown picker', textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openDateTimePicker(
                  context,
                );
              },
              child: Text('Workday Picker', textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openDateTimePickerWeekend(
                  context,
                );
              },
              child: Text('Weekend Day Picker', textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }

  void _openSimpleItemPicker(BuildContext context, List<Widget> items) {
    BottomPicker(
      items: items,
      headerBuilder: (context) {
        return Row(
          children: [
            Expanded(
              child: Text(
                'Choose your country',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close),
            ),
          ],
        );
      },
      backgroundColor: Colors.yellow.withValues(
        alpha: 0.6,
      ),
      bottomPickerTheme: BottomPickerTheme.morningSalad,
      onSubmit: (index) {
        print(index);
      },
      buttonAlignment: MainAxisAlignment.start,
      displaySubmitButton: false,
      dismissable: true,
      onDismiss: (p0) {
        print(p0);
      },
    ).show(context);
  }

  void _openSecondSimpleItemPicker(BuildContext context, List<Widget> items) {
    BottomPicker(
      items: items,
      selectedItemIndex: 1,
      headerBuilder: (context) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose country',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Select your country of origins'),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close),
              ),
            ],
          ),
        );
      },
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
        Navigator.pop(context);
      },
      onDismiss: (p0) {
        print(p0);
      },
      bottomPickerTheme: BottomPickerTheme.morningSalad,
    ).show(context);
  }

  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      headerBuilder: (context) {
        return Row(
          children: [
            Text(
              'Set your Birthday',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
          ],
        );
      },
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(1996, 10, 22),
      maxDateTime: DateTime(1998),
      minDateTime: DateTime(1980),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
      },
      onDismiss: (p0) {
        print(p0);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  void _openYearDatePicker(BuildContext context) {
    BottomPicker.year(
      headerBuilder: (context) {
        return Row(
          children: [
            Text(
              'Set your Birthday Year',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
          ],
        );
      },
      initialDateTime: DateTime(1996),
      maxDateTime: DateTime(1998),
      minDateTime: DateTime(1980),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
        Navigator.pop(context);
      },
      onDismiss: (p0) {
        print(p0);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  void _openMonthYearPicker(BuildContext context) {
    BottomPicker.monthYear(
      headerBuilder: (context) {
        return Row(
          children: [
            Text(
              'Set your Birth Month',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
          ],
        );
      },
      initialDateTime: DateTime(1996, 10, 22),
      onChange: (index) {
        print(index);
      },
      onDismiss: (p0) {
        print(p0);
      },
    ).show(context);
  }

  void _openDatePickerWithButtonStyle(BuildContext context) {
    BottomPicker.date(
      headerBuilder: (context) {
        return Row(
          children: [
            Text(
              'Set your Birthday',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
          ],
        );
      },
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(1996, 10, 22),
      maxDateTime: DateTime(1998),
      minDateTime: DateTime(1980),
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
            ),
          ],
        ),
      ),
    ).show(context);
  }

  void _openRangeDatePicker(BuildContext context) {
    BottomPicker.range(
      headerBuilder: (context) {
        return Column(
          children: [
            Text(
              'Set date range',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Text(
              'Please select a first date and an end date',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        );
      },
      dateOrder: DatePickerDateOrder.dmy,
      initialSecondDate: DateTime.now().add(Duration(days: 230)),
      itemExtent: 20,
      onRangeDateSubmitPressed: (firstDate, secondDate) {
        print(firstDate);
        print(secondDate);
      },
      onRangePickerDismissed: (p0, p1) {
        print(p0);
        print(p1);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  void _openRangeTimePicker(BuildContext context) {
    BottomPicker.rangeTime(
      headerBuilder: (context) {
        return Column(
          children: [
            Text(
              'Set Time range',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Text(
              'Please select a first time and an end time',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        );
      },
      showTimeSeparator: true,
      bottomPickerTheme: BottomPickerTheme.plumPlate,
      onRangeTimeSubmitPressed: (firstDate, secondDate) {
        print(firstDate);
        print(secondDate);
      },
      onRangePickerDismissed: (p0, p1) {
        print(p0);
        print(p1);
      },
    ).show(context);
  }

  void _openTimePicker(BuildContext context) {
    BottomPicker.time(
      headerBuilder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Set your next meeting time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
                print('Picker closed');
                Navigator.pop(context);
              },
              child: Text(
                'close',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        );
      },
      use24hFormat: false,
      onSubmit: (index) {
        print(index);
      },
      bottomPickerTheme: BottomPickerTheme.orange,
      initialTime: Time(
        minutes: 23,
      ),
      maxTime: Time(
        hours: 17,
      ),
    ).show(context);
  }

  void _openTimerPicker(BuildContext context) {
    BottomPicker.timer(
      headerBuilder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Set your next meeting time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
                print('Picker closed');
                Navigator.pop(context);
              },
              child: Text(
                'close',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        );
      },
      onChange: (p0) => print(p0),
      onSubmit: (index) {
        print(index);
      },
      initialTimerDuration: Duration(
        hours: 6,
        minutes: 30,
      ),
      timerPickerMode: CupertinoTimerPickerMode.hms,
    ).show(context);
  }

  void _openDateTimePicker(
    BuildContext context,
  ) {
    BottomPicker.dateTime(
      minuteInterval: 2,
      headerBuilder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Set the event exact time and date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
                print('Picker closed');
                Navigator.pop(context);
              },
              child: Text(
                'close',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        );
      },
      onSubmit: (date) {
        print(date);
      },
      minDateTime: DateTime(2021, 5, 1),
      maxDateTime: DateTime(2021, 8, 2),
      initialDateTime: DateTime(2021, 5, 1),
      gradientColors: [
        Color(0xfffdcbf1),
        Color(0xffe6dee9),
      ],
      calendarDays: CupertinoDatePickerWidget.workDays,
    ).show(context);
  }

  void _openDateTimePickerWeekend(
    BuildContext context,
  ) {
    BottomPicker.dateTime(
      minuteInterval: 2,
      headerBuilder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Set the event exact time and date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
                print('Picker closed');
                Navigator.pop(context);
              },
              child: Text(
                'close',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        );
      },
      onSubmit: (date) {
        print(date);
      },
      minDateTime: DateTime(2021, 5, 1),
      maxDateTime: DateTime(2021, 8, 2),
      initialDateTime: DateTime(2021, 5, 1),
      gradientColors: [
        Color(0xfffdcbf1),
        Color(0xffe6dee9),
      ],
      calendarDays: CupertinoDatePickerWidget.weekend,
    ).show(context);
  }
}
