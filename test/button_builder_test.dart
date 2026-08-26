import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/widgets/bottom_picker_button.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Button builder tests...', () {
    late List<int> items = List.generate(
      10,
      (index) => index,
    );

    testWidgets(
        'Use case: no button builder provided, displaySubmitButton = false',
        (tester) async {
      var bottomPicker = BottomPicker(
        headerBuilder: (context) {
          return Text('Item picker');
        },
        items: items,
        displaySubmitButton: false,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: bottomPicker,
          ),
        ),
      );

      expect(find.byType(BottomPickerButton), findsNothing);
      expect(bottomPicker.buttonBuilder, isNull);
    });

    testWidgets(
        'Use case: buttonBuilder provided, displaySubmitButton = false, buttonBuilder should be used',
        (tester) async {
      var bottomPicker = BottomPicker(
        headerBuilder: (context) {
          return Text('Item picker');
        },
        items: items,
        displaySubmitButton: false,
        buttonBuilder: (instance, context) {
          return ElevatedButton(
            onPressed: () {},
            child: Text('Custom Button'),
          );
        },
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: bottomPicker,
          ),
        ),
      );

      expect(find.byType(BottomPickerButton), findsNothing);
      expect(bottomPicker.buttonBuilder, isNotNull);
      expect(find.text('Custom Button'), findsOneWidget);
    });

    testWidgets(
        'Use case: buttonBuilder is not provided but displaySubmitButton = true, default button should be used',
        (tester) async {
      var bottomPicker = BottomPicker(
        headerBuilder: (context) {
          return Text('Item picker');
        },
        items: items,
        buttonContent: Text('Submit'),
        buttonBuilder: null,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: bottomPicker,
          ),
        ),
      );

      expect(find.byType(BottomPickerButton), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
      expect(bottomPicker.buttonBuilder, isNull);
    });

    testWidgets(
        'Use case: buttonBuilder is provided and displaySubmitButton = true, buttonBuilder should be used',
        (tester) async {
      var bottomPicker = BottomPicker(
        headerBuilder: (context) {
          return Text('Item picker');
        },
        items: items,
        buttonContent: Text('Submit'),
        buttonBuilder: (instance, context) {
          return ElevatedButton(
            onPressed: () {},
            child: Text('Custom Button'),
          );
        },
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: bottomPicker,
          ),
        ),
      );

      expect(find.byType(BottomPickerButton), findsNothing);
      expect(find.text('Custom Button'), findsOneWidget);
      expect(bottomPicker.buttonBuilder, isNotNull);
    });
  });
}
