import 'package:feburary_flutter/screens/self_service/controller/self_service_controller.dart';
import 'package:get/get.dart';

class SelfServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelfServiceController());
  }
}
