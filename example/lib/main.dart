import 'package:bottom_picker/bottom_picker.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
        onPressed: () {
          BottomPicker(
            title: "Choose trip date",
            items: [
              Text("Ali"),
              Text("Fathi"),
              Text("Badr"),
              Text("Salah")
            ],
            onSubmit: (data){
              print(data);
            },
          ).show(context);
        },
        child: Text("Click Here"),
      )),
    );
  }
}
