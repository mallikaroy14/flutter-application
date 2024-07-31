import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  // late List<CameraDescription> cameras;


  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
