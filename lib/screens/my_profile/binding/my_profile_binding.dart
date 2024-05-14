import 'package:feburary_flutter/screens/my_profile/controller/my_profile_controller.dart';
import 'package:get/get.dart';

class MyPrpfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MyProfileController());
  }
}