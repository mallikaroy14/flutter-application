import 'package:feburary_flutter/whatsapp/status/controller/status_controller.dart';
import 'package:get/get.dart';

class StatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StatusController());
  }
}
