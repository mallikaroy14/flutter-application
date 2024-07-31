import 'package:feburary_flutter/theme/app_colors.dart';
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
      body: Container(
        child: Column(
          children: [
            Obx(
              () => ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: controller.chatList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                          backgroundColor: Colors.blueGrey,
                        ),
                        title: Text(controller.chatList[index].name),
                        subtitle: Row(
                          children: [
                            controller.isRead.isTrue
                                ? const Icon(Icons.done_all,
                                    color: AppColors.tealBlueColor, size: 18)
                                : const Icon(Icons.done_all,
                                    color: AppColors.grayColor, size: 18),
                            Text(controller.chatList[index].currentMessage),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              controller.chatList[index].time,
                              style: const TextStyle(fontSize: 15),
                            ),
                            controller.isSilent.isTrue
                                ? const Icon(Icons.volume_mute)
                                : const Icon(Icons.volume_down),
                          ],
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
