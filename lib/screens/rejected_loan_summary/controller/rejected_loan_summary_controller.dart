import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RejectedLoanSummaryController extends SuperController {

  final ExpansionTileController expandController = ExpansionTileController();
  final customTileExpanded = false.obs;
  final isExpanded = false.obs;
  final _isExpanded = false.obs;

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
