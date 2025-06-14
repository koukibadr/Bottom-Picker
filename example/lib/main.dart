// ignore_for_file: avoid_print

import 'package:bottom_picker/bottom_picker.dart';
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
                _openArabicRangeDatePicker(context);
              },
              child:
                  Text('Arabic Range Date Picker', textAlign: TextAlign.center),
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
                _openDateTimePicker(context);
              },
              child: Text('Date and Time Picker', textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openDateTimePickerWithCustomButton(context);
              },
              child: Text(
                'Bottom picker with custom button',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openPickerWithCustomPickerTextStyle(context);
              },
              child: Text(
                'Bottom picker with custom picker text style',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openSimpleItemPicker(BuildContext context, List<Widget> items) {
    BottomPicker(
      items: items,
      pickerTitle: Text(
        'Choose your country',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      backgroundColor: Colors.yellow.withValues(
        alpha: 0.6,
      ),
      bottomPickerTheme: BottomPickerTheme.morningSalad,
      onSubmit: (index) {
        print(index);
      },
      onCloseButtonPressed: () {
        print('This message is displayed when close button is pressed');
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
      pickerTitle: Text(
        'اختر بلدك',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      pickerDescription: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.flag),
          Text(
            'اختر جنسيتك من القائمة الموجودة تحت',
            textAlign: TextAlign.end,
          ),
        ],
      ),
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
      layoutOrientation: TextDirection.rtl,
      closeOnSubmit: false,
    ).show(context);
  }

  void _openDatePicker(BuildContext context) {
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
      onDismiss: (p0) {
        print(p0);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  void _openMonthYearPicker(BuildContext context) {
    BottomPicker.monthYear(
      pickerTitle: Text(
        'Set your Birth Month',
      ),
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
      initialSecondDate: DateTime.now().add(Duration(days: 230)),
      itemExtent: 10,
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
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
      pickerTitle: Text(
        'Set Time range',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      pickerDescription: Text(
        'Please select a first time and an end time',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
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

  void _openArabicRangeDatePicker(BuildContext context) {
    BottomPicker.range(
      pickerTitle: Text(
        'حدد النطاق الزمني',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      pickerDescription: Text(
        'الرجاء تحديد أول تاريخ وتاريخ انتهاء',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      dateOrder: DatePickerDateOrder.dmy,
      layoutOrientation: TextDirection.rtl,
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
  }

  void _openTimePicker(BuildContext context) {
    BottomPicker.time(
      pickerTitle: Text(
        'Set your next meeting time',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.orange,
        ),
      ),
      use24hFormat: false,
      onSubmit: (index) {
        print(index);
      },
      onCloseButtonPressed: () {
        print('Picker closed');
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
      pickerTitle: Text(
        'Set your next meeting time',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.orange,
        ),
      ),
      onChange: (p0) => print(p0),
      onSubmit: (index) {
        print(index);
      },
      initialTimerDuration: Duration(
        hours: 6,
        minutes: 30,
      ),
      onCloseButtonPressed: () {
        print('Picker closed');
      },
      timerPickerMode: CupertinoTimerPickerMode.hms,
    ).show(context);
  }

  void _openDateTimePicker(BuildContext context) {
    BottomPicker.dateTime(
      minuteInterval: 2,
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
      onCloseButtonPressed: () {
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
  }

  void _openDateTimePickerWithCustomButton(BuildContext context) {
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
      onCloseButtonPressed: () {
        print('Picker closed');
      },
      buttonSingleColor: Colors.pink,
      minDateTime: DateTime(2021, 5, 1),
      maxDateTime: DateTime(2021, 8, 2),
      gradientColors: [
        Color(0xfffdcbf1),
        Color(0xffe6dee9),
      ],
    ).show(context);
  }

  void _openPickerWithCustomPickerTextStyle(BuildContext context) {
    BottomPicker(
      items: List.generate(
        20,
        (i) => Center(
          child: Text('Actor $i'),
        ),
      ),
      pickerTitle: Text('Choose an actor'),
      titleAlignment: Alignment.center,
      pickerTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      onChange: (p0) {
        print(p0);
      },
      closeIconColor: Colors.red,
    ).show(context);
  }
}
