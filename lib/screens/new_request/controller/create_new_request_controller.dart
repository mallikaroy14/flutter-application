import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewRequestController extends SuperController{
  final list = <String>[].obs;
  final serviceRequestType = TextEditingController();
  final loanAccount = TextEditingController();
  final name = TextEditingController();
  final mobileNumber = TextEditingController();
  final emailID = TextEditingController();
  final remark = TextEditingController();
  final mobileController = TextEditingController();

  final emailController = TextEditingController();
  final emailError = "".obs;
  final isEmailValid = false.obs;
  final nameController = TextEditingController();
  final nameError = "".obs;
  final isNameValid = false.obs;
  final statesController = MaterialStatesController();



  @override
  void onReady() {
    loadList();
    super.onReady();
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


  void nameValidation() {
    nameController.addListener(() {
      if (nameController.text.isNotEmpty) {
        if (nameController.text.length > 2) {
          nameError.value = "";
          isNameValid.value = true;
          statesController.update(
            MaterialState.disabled,
            false,
          );
        } else {
          isNameValid.value = false;
          statesController.update(
            MaterialState.disabled,
            true,
          );
          nameError.value = "Error";
        }
      } else {
        isNameValid.value = false;
        statesController.update(
          MaterialState.disabled,
          true,
        );
        nameError.value = "Error";
      }
    });
  }

  void emailValidation() {
    emailController.addListener(() {
      if (emailController.text.isNotEmpty) {
        if (emailController.text.isEmail) {
          emailError.value = "";
          isEmailValid.value = true;
        } else {
          isEmailValid.value = false;
          emailError.value = "Error";
        }
      } else {
        isEmailValid.value = false;
        emailError.value = "Error";
      }
    });
  }
  void loadList() {
    list.value = List<String>.generate(10, (i) {
      return "item $i";
    });
  }
}