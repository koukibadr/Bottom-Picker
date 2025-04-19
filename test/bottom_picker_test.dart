import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/widgets/bottom_picker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Simple picker item testing...', () {
    late List<Widget> items = List.generate(
      10,
      (index) => Text('Item $index'),
    );

    testWidgets('Simple use case: picker should function properly',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BottomPicker(
              pickerTitle: Text('Item picker'),
              items: items,
            ),
          ),
        ),
      );

      // Verify that the picker title is displayed
      expect(find.text('Item picker'), findsOneWidget);
      // Verify that the items are displayed
      expect(find.text('Item 1'), findsOneWidget);
    });

    testWidgets('On change callback should be called when an item is selected',
        (tester) async {
      int itemIndex = -1;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BottomPicker(
              pickerTitle: Text('Item picker'),
              items: items,
              onChange: (index) {
                itemIndex = index;
              },
            ),
          ),
        ),
      );

      expect(itemIndex, -1);

      await tester.drag(
        find.text('Item 1'),
        const Offset(0.0, -20.0),
      ); // see top of file
      await tester.pump();
      expect(itemIndex, 1);

      await tester.drag(
        find.text('Item 2'),
        const Offset(0.0, -40.0),
      ); // see top of file
      await tester.pump();
      expect(itemIndex, 2);

      await tester.drag(
        find.text('Item 3'),
        const Offset(0.0, -60.0),
      ); // see top of file
      await tester.pump();
      expect(itemIndex, 3);
    });

    testWidgets(
        'On submit callback invoked when pressing submit button: index should be changed',
        (tester) async {
      var index = -1;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BottomPicker(
              pickerTitle: Text('Item picker'),
              items: items,
              onSubmit: (p0) {
                index = p0;
              },
            ),
          ),
        ),
      );

      await tester.drag(
        find.text('Item 2'),
        const Offset(0.0, -60.0),
      ); // see top of file
      await tester.pump();
      await tester.tap(find.byType(BottomPickerButton));
      await tester.pumpAndSettle();
      expect(index, 2);

      // Test that the picker is closed after submit
      expect(find.byType(BottomPicker), findsNothing);
    });

    testWidgets('On dismiss callback invoked when pressing submit button',
        (tester) async {
      var index = -1;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BottomPicker(
              pickerTitle: Text('Item picker'),
              items: items,
              onDismiss: (p0) {
                index = 9;
              },
            ),
          ),
        ),
      );

      await tester.drag(
        find.text('Item 2'),
        const Offset(0.0, -60.0),
      ); // see top of file
      await tester.pump();
      await tester.tap(find.byType(BottomPickerButton));
      await tester.pumpAndSettle();
      expect(index, 9);

      // Test that the picker is closed after submit
      expect(find.byType(BottomPicker), findsNothing);
    });

    testWidgets(
        'onCloseButtonPressed callback invoked when pressing the close icon',
        (tester) async {
      var index = -1;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BottomPicker(
              displayCloseIcon: true,
              pickerTitle: Text('Item picker'),
              items: items,
              onCloseButtonPressed: () {
                index = 9;
              },
            ),
          ),
        ),
      );

      await tester.drag(
        find.text('Item 2'),
        const Offset(0.0, -60.0),
      ); // see top of file
      await tester.pump();
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(index, 9);

      // Test that the picker is closed after submit
      expect(find.byType(BottomPicker), findsNothing);
    });
  });
}
