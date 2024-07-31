
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginController extends SuperController {
  final mobileController = TextEditingController();
  final mobileTextEditing = TextEditingValue();
  final mobileError = "".obs;
  final isMobileValid = false.obs;
  final statesController = WidgetStatesController();

  @override
  void onInit() {
    super.onInit();
    mobileValid();
  }

  void mobileValid() {
    mobileController.addListener(() {
      if (mobileController.text.isNotEmpty) {
        if ( mobileController.text.length < 11) {
          mobileError.value = "Please enter valid mobile number";
          isMobileValid.value = false;
          statesController.update(
            MaterialState.disabled,
            true, // or false depending on your logic
          );
        } else {
          mobileError.value = "";
          isMobileValid.value = true;
          statesController.update(
            MaterialState.disabled,
            false, // or false depending on your logic
          );
        }
      } else {
        mobileError.value = "Please enter mobile number";
        isMobileValid.value = false;
        statesController.update(
          MaterialState.disabled,
          true, // or false depending on your logic
        );
      }
    });
  }

  @override
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 6) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 5) + '-');
      if (newValue.selection.end >= 3)
        selectionIndex += 2;
    }
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: newText.length),
    );
  }
}
