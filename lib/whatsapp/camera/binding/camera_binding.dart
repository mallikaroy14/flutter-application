import 'package:get/get.dart';

import '../controller/camera_screen_controller.dart';

class CameraBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CameraScreenController());
  }

}