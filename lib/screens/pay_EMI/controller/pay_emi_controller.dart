
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayEmiController extends GetxController {

  late TabController _controller;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  @override
  void onInit() {
    // _controller = TabController(length: 3, vsync: this);

    super.onInit();
  }
  @override
  void onDetached() {
  }

  @override
  void onHidden() {
  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {
  }

  @override
  void onResumed() {
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }

}