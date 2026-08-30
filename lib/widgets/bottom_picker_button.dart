import 'package:bottom_picker/resources/arrays.dart';
import 'package:material_ui/material_ui.dart';

/// A button widget that can be used to open the bottom picker.
@Deprecated(
  'Will be replaced with button builder callback in the future. check [BottomPicker].',
)
class BottomPickerButton extends StatelessWidget {
  /// The callback function that is called when the button is pressed.
  final Function onClick;

  /// The theme of the button.
  final BottomPickerTheme theme;

  /// The list of colors to be used for the gradient background of the button.
  final List<Color>? gradients;

  /// The solid color to be used for the background of the button.
  final Color? solidColor;

  /// The padding to be used for the button.
  final double? buttonPadding;

  /// The width of the button.
  final double? buttonWidth;

  /// The child widget to be used for the button.
  final Widget? buttonChild;

  /// The style to be used for the button.
  final BoxDecoration? style;

  const BottomPickerButton({
    super.key,
    required this.onClick,
    this.theme = BottomPickerTheme.blue,
    this.gradients,
    this.solidColor,
    this.buttonPadding,
    this.buttonWidth,
    this.buttonChild,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick.call();
      },
      child: Container(
        width: buttonWidth ?? 100,
        padding: EdgeInsets.all(buttonPadding ?? 8.0),
        decoration:
            style ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: solidColor,
              gradient: solidColor == null
                  ? LinearGradient(
                      colors: gradients ?? theme.gradientColors,
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: const [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    )
                  : null,
            ),
        child:
            buttonChild ??
            const Center(
              child: Text('Select', style: TextStyle(color: Colors.white)),
            ),
      ),
    );
  }
}
