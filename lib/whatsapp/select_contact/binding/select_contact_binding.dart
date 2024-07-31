import 'package:feburary_flutter/whatsapp/select_contact/controller/select_contact_controller.dart';
import 'package:get/get.dart';

class SelectContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectContactController());
  }

}