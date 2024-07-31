import 'package:feburary_flutter/whatsapp/calls/controller/calls_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

class CallScreen extends GetResponsiveView<CallsController> {
  CallScreen({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      body: Text("CallsCallsCalls"),

    );
    return super.builder();
  }
}
