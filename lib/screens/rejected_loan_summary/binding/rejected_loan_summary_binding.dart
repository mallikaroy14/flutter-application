import 'package:feburary_flutter/screens/rejected_loan_summary/controller/rejected_loan_summary_controller.dart';
import 'package:get/get.dart';

class RejectedLoanSummaryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RejectedLoanSummaryController());
  }
}