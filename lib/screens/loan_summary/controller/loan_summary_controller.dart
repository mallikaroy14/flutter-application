import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoanSummaryController extends SuperController{

  final mobileController = TextEditingController();
  final mobileTextEditing = TextEditingValue();
  final mobileError = "".obs;

  @override
  void onInit() {

    super.onInit();
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
}