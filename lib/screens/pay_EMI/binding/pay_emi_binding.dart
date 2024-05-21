import 'package:feburary_flutter/screens/pay_EMI/controller/pay_emi_controller.dart';
import 'package:get/get.dart';

class PayEmiBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(PayEmiController());
  }

}