import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends SuperController{
  final stateController = MaterialStatesController();
  final pinValid = false.obs;
  final pinFocusNode = FocusNode();
  final pinController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isPinValid();
  }

  @override
  void onDetached() {
  }

  @override
  void onHidden() {
  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {
  }

  @override
  void onResumed() {
  }

  void isPinValid(){
    pinController.addListener(() {
      if(pinController.text.isNotEmpty){
        if(pinController.text == "1234"){
          print("isPinValid: ${pinController.text}");
          pinValid.value = true;
          stateController.update(MaterialState.disabled, false);
        }else{
          print("isPinValid: ${pinController.text}");
          pinValid.value = false;
          stateController.update(MaterialState.disabled, true);
        }
      }else{
        print("isPinValid: ${pinController.text}");
        pinValid.value = false;
        stateController.update(MaterialState.disabled, true);
      }
    });
  }

}