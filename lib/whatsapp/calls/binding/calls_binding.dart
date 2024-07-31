import 'package:feburary_flutter/whatsapp/calls/controller/calls_controller.dart';
import 'package:get/get.dart';

class CallsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CallsController());
  }

}