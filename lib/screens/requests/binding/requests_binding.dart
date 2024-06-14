import 'package:feburary_flutter/screens/requests/controller/requests_controller.dart';
import 'package:get/get.dart';

class RequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RequestsController());
  }
}
