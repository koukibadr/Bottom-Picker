## [2.11.1] - 25/02/2025

**Changes:** 
- enable bottom picker dismiss with escape keyboard key for web and desktop.
- enable MacOS support for bottom picker example project.

## [2.11.0] - 01/02/2025

**Changes:** 
- enable `minutesInterval` feature for range time picker.

## [2.10.1] - 21/01/2025

**Changes:** 
- `onClose` is renamed to `onCloseButtonPressed`.

**Bug Fixes:** 
- remove late keyword from `minuteInterval` definition.

## [2.10.0] - 08/12/2024

**Changes:** 
- Add `monthYear` constructor to display date range with only month and year.

## [2.9.0] - 10/11/2024

**Enhancement:** 
- Update inital date and min date check when using range date picker.
  
**Changes:** 
- Add `rangeTime` constructor to display time range picker.

**Bug Fix:** 
- Fix `initialFirstDate` initialization in date range picker.

## [2.8.0] - 09/06/2024

**Enhancement:** 
- `layoutOrientation` is now of type `textDirection` rather than custom `LayoutOrientation` enum.
- Update package examples with new `layoutOrientation` attribute type.
  
**Changes:** 
- Remove `onPopClose` deprecated attribute.


## [2.7.0] - 27/04/2024

**Enhancement:** 
- Remove deprecated `title`, `description`, `titleStyle` and `descriptionStyle` attributes and replaced by `pickerTitle` and `pickerDesciption` of widget type.
- Mark `pickerTitle` as deprecated.
- `onClose` will override the close button onTap function.

## [2.6.0] - 23/03/2024

**Enhancement:** 
- Create `pickerTitle` and `pickerDescription` instead of `title`, `description`, `titleStyle` and `descriptionStyle`.
- Use stack widget to display title and close icon in same line rather than columns and rows, for better alignement.
- Change `titleAlignment` type to `Alignment` instead of `MainAxisAlignment`.

**Bug fixes**
- Update `items` from List<Text> to List<Widget> for better rendering.

## [2.5.0] - 21/03/2024

- **Enhancement:** 
- `popOnClose` added to indicate whether the bottom picker will pop when closing or not, useful when using the bottom picker as layout widget.

## [2.4.0] - 04/02/2024

- **Layout enhancement:** Update confirmation button design and attributes.
- `iconColor` , `buttonText` , `buttonTextStyle`, `displayButtonIcon`, `buttonTextAlignment` removed.
- Added `buttonContent`, `buttonStyle` attributes.
- Picker content padding updated.

## [2.3.3] - 10/12/2023

- Fix `onSubmit` attribute callback code and selected value retrieval from date and time picker [issue link](https://github.com/koukibadr/Bottom-Picker/issues/80).

## [2.3.2] - 14/11/2023

- Fix date picker date initlization (`initialDateTime`, `maxDateTime`, `minDateTime`) [issue-76](https://github.com/koukibadr/Bottom-Picker/issues/76).

## [2.3.1] - 12/11/2023

- Fix minutes set value in the `time` constructor.
- Update `time` constructor to use `Time` class to ease setting hours and minutes values [PR-75](https://github.com/koukibadr/Bottom-Picker/pull/75).

## [2.2.1] - 22/10/2023

- Fix analysis issues.

## [2.2.0] - 2/10/2023

- Add localization support and multiple language support.

## [2.1.1] - 27/09/2023

- Update package license to MIT license.

## [2.1.0] - 12/09/2023

- **Enhancements:**
    - Added title padding to title widget.
    - Added title alignement.
    - Button padding, button width, Button text alignement and Button alignement  parameters.
    - Customizable close icon size.
    - Added `selectionOverlay` parameter.
    - Date range picker dates attributes assertion.
- **Bug fixes**
    - Date range picker initial dates error.
    - Button padding issue.

## [2.0.4] - 30/05/2023

- Fix minute interval issue for cupertino date picker [https://github.com/flutter/flutter/issues/60456](https://github.com/flutter/flutter/issues/60456).

## [2.0.3] - 27/05/2023

- Fix automatic refresh issue when the second date was smaller than the first date.
- Fix: Inability to decrease the second date even if the first date was smaller ([PR link](https://github.com/koukibadr/Bottom-Picker/pull/65)).


## [2.0.2] - 02/04/2023

- Fix range picker initialization error (issue [#59](https://github.com/koukibadr/Bottom-Picker/issues/59)).

## [2.0.1] - 24/10/2022

- Update displayCloseIcon usage in code.

## [2.0.0] - 01/10/2022

- Add range date picker.
- Add description attribute.
- Add description text style attribute.

## [1.9.1] - 27/06/2022

- Fix static analysis issues.

## [1.9.0] - 27/06/2022

- add minuteInterval attibute.
- Bug fixes.

## [1.8.0] - 19/03/2022

- Add display submit button parameter.
- bug fixes.

## [1.7.0] - 16/02/2022

- Add height parameter to bottom picker widget.
- bug fixes.

## [1.6.0] - 12/02/2022

- Update padding rendering in bottom picker widget.
- Add button alignement parameter.
- enhanced coding style.
- bug fixes.

## [1.5.0] - 01/19/2022

- Add close icon color parameter.
- Add close icon display parameter.
- Add different layout orientation options (LTR, RTL).

## [1.4.0] - 23/12/2021

- Add picker text style attribute.
- Add date format order parameter.
- Add item extent parameter.

## [1.1.0] - 20/11/2021

- Add background color parameter.
- Enhanced rendering performance.
- Bug fixes.

## [1.0.6] - 20/11/2021

- Bug fixes.

## [1.0.5] - 13/11/2021

- Enhanced tablet view.
- remove uneccessary parameters in datetime constructors.

## [1.0.4] - 06/11/2021

- Add selected index parameter.

## [1.0.3] - 22/10/2021

- Fix bugs.
- Add customization support to confirm button.

## [1.0.2] - 27/08/2021

- Fix bottom picker drag bug.

## [1.0.1] - 15/01/2021

- Fix onSubmit return value bug.

## [1.0.0] - 08/01/2021

- Simple list item picker.
- Date picker with max and min dates configuration.
- Time picker with 12h/24h time format.
- Date and time picker.
- Multiple built-in themes.
- Customized button theme with custom colors.
- On item change / On submit and On close callback handlers.
