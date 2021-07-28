import 'package:bottom_picker/widgets/bottom_picker_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomPicker extends StatelessWidget {
  show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BottomSheet(
              backgroundColor: Colors.transparent,
              onClosing: () {},
              builder: (context) {
                return this;
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Choose trip date"),
                  Icon(Icons.close, color: Colors.black, size: 20)
                ],
              ),
            ),
            Container(
              height: 150,
              width: 150,
              child: CupertinoPicker(
                  itemExtent: 40,
                  onSelectedItemChanged: (int) {},
                  children: [
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data")
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomPickerButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
