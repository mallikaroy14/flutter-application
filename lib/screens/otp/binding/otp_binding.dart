import 'package:feburary_flutter/screens/otp/controller/otp_controller.dart';
import 'package:get/get.dart';

class OTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OTPController());
  }
}
