import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanSummaryController extends SuperController{

  final mobileController = TextEditingController();
  final mobileTextEditing = TextEditingValue();
  final mobileError = "".obs;
  final ExpansionTileController expandController = ExpansionTileController();

  final customTileExpanded = false.obs;


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