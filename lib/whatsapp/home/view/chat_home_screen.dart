import 'package:camera/camera.dart';
import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:feburary_flutter/whatsapp/calls/view/callScreen.dart';
import 'package:feburary_flutter/whatsapp/camera/view/camera.dart';
import 'package:feburary_flutter/whatsapp/chat_page/controller/chat_controller.dart';
import 'package:feburary_flutter/whatsapp/chat_page/view/chat_screen.dart';
import 'package:feburary_flutter/whatsapp/home/controller/chat_home_controller.dart';
import 'package:feburary_flutter/whatsapp/select_contact/controller/select_contact_controller.dart';
import 'package:feburary_flutter/whatsapp/select_contact/view/select_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../camera/controller/camera_screen_controller.dart';
import 'package:feburary_flutter/whatsapp/camera/controller/camera_screen_controller.dart';

class ChatHomeScreen extends GetResponsiveView<ChatHomeController> {
  ChatHomeScreen({super.key});

  @override
  Widget? builder() {
    // controller.cameras = availableCameras();
    // WidgetsFlutterBinding.ensureInitialized();
    Get.put(CameraScreenController());
    Get.put(ChatController());
    Get.put(SelectContactController());
    Get.put(CallScreen());

    // final CameraScreenController cameraController = Get.find<CameraScreenController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whatsPrimary,
        title: Text(
          "WhatsApp",
          style: TextStyle(color: AppColors.whiteColor),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: AppColors.whiteColor)),
          PopupMenuButton(
              iconColor: AppColors.whiteColor,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      value: "New Group",
                      onTap: () {},
                      child: const Text("New Group")),
                  PopupMenuItem(
                      value: "New Group",
                      onTap: () {},
                      child: const Text("New broadcast")),
                  PopupMenuItem(
                      value: "New Group",
                      onTap: () {},
                      child: const Text("Linked devices")),
                  PopupMenuItem(
                      value: "New Group",
                      onTap: () {},
                      child: const Text("Starred messages")),
                  PopupMenuItem(
                      value: "New Group",
                      onTap: () {},
                      child: const Text("Payments")),
                  PopupMenuItem(
                      value: "New Group",
                      onTap: () {},
                      child: const Text("Settings"))
                ];
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          child: Column(
            children: [
              Container(
                color: AppColors.whatsPrimary,
                child: TabBar(
                  unselectedLabelColor: AppColors.greyColor,
                  labelColor: AppColors.whiteColor,
                  controller: controller.tabController,
                  tabs: [
                    Tab(
                        icon: Icon(
                      Icons.camera_alt,
                      color: AppColors.greyColor,
                    )),
                    Tab(text: "Chats"),
                    Tab(text: "Status"),
                    Tab(text: "Calls"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      Camera(),
                      ChatScreen(),
                      Text("Story"),
                      CallScreen()
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
