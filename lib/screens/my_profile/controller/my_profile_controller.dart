import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyProfileController extends SuperController{

  final mobileController = TextEditingController();
  final mobileError = "".obs;

  final listIndex = 0.obs;

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


  void onLanguageChange(int index){
    print("onLanguageChange: $index");
    listIndex.value = index;
  }

}