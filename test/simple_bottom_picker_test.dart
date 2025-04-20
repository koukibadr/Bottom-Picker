import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
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
      var bottomPicker = BottomPicker(
        pickerTitle: Text('Item picker'),
        items: items,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: bottomPicker,
          ),
        ),
      );

      // Verify that the picker title is displayed
      expect(find.text('Item picker'), findsOneWidget);
      // Verify that the items are displayed
      expect(find.text('Item 1'), findsOneWidget);

      expect(bottomPicker.bottomPickerType, BottomPickerType.simple);
    });

    testWidgets('On change callback should be called when an item is selected',
        (tester) async {
      // Arrange
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

      // Act
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

    testWidgets('Testing picker widgets display  flags', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BottomPicker(
              displayCloseIcon: false,
              displaySubmitButton: false,
              pickerTitle: Text('Item picker'),
              items: items,
            ),
          ),
        ),
      );

      // Verify that the close button and submit button are not rendered
      expect(find.byType(CloseButton), findsNothing);
      expect(find.byType(BottomPickerButton), findsNothing);
    });

    test('Testing bottom picker assertions', () async {
      expect(
        () => MaterialApp(
          home: Scaffold(
            body: BottomPicker(
              pickerTitle: Text('Item picker'),
              items: items,
            ),
          ),
        ),
        returnsNormally,
      );

      expect(
        () => MaterialApp(
          home: Scaffold(
            body: BottomPicker(
              displayCloseIcon: false,
              displaySubmitButton: false,
              pickerTitle: Text('Item picker'),
              items: [],
            ),
          ),
        ),
        throwsA(
          isA<AssertionError>(),
        ),
      );

      expect(
        () => MaterialApp(
          home: Scaffold(
            body: BottomPicker(
              displayCloseIcon: false,
              displaySubmitButton: false,
              pickerTitle: Text('Item picker'),
              items: items,
              selectedItemIndex: 12,
            ),
          ),
        ),
        throwsA(
          isA<AssertionError>(),
        ),
      );

      expect(
        () => MaterialApp(
          home: Scaffold(
            body: BottomPicker(
              displayCloseIcon: false,
              displaySubmitButton: false,
              pickerTitle: Text('Item picker'),
              items: items,
              selectedItemIndex: -4,
            ),
          ),
        ),
        throwsA(
          isA<AssertionError>(),
        ),
      );
    });
  });
}
