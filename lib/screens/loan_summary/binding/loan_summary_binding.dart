
import 'package:feburary_flutter/screens/loan_summary/controller/loan_summary_controller.dart';
import 'package:get/get.dart';

class LoanSummaryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoanSummaryController());
  }
}