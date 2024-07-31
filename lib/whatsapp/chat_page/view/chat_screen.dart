import 'package:feburary_flutter/utility/router/route_name.dart';
import 'package:feburary_flutter/whatsapp/chat_page/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends GetResponsiveView<ChatController> {
  ChatScreen({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(RouteName.selectContactScreen);
          },
          child: Icon(Icons.chat)),
      body: Text("Chat"),
    );
  }
}
