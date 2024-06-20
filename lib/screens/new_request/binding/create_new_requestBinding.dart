import 'package:get/get.dart';

import '../controller/create_new_request_controller.dart';

class CreateNewRequestBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CreateNewRequestController());
  }
}