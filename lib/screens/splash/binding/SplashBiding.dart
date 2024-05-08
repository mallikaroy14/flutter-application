import 'package:feburary_flutter/screens/splash/controller/SplashController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
