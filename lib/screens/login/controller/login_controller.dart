import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends SuperController {
  final mobileController = TextEditingController();
  final mobileError = "".obs;

  @override
  void onInit() {
    super.onInit();
    isMobileValid();
  }

  void isMobileValid() {
    bool isMobileValid = false;
    mobileController.addListener(() {
      if (mobileController.text.isNotEmpty) {
        if (mobileController.text.isPhoneNumber) {
          mobileError.value = "";
          isMobileValid = true;
        } else {
          mobileError.value = "Please enter valid mobile number";
          isMobileValid = false;
        }
      } else {
        mobileError.value = "Please enter mobile number";
        isMobileValid = false;
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
