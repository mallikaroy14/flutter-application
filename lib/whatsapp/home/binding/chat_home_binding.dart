import 'package:feburary_flutter/whatsapp/home/controller/chat_home_controller.dart';
import 'package:get/get.dart';

class ChatHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ChatHomeController());
  }
}