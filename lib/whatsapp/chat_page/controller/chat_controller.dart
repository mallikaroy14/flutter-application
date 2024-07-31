import 'package:feburary_flutter/whatsapp/model/chat_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final chatList = <ChatModel>[].obs;
  final RxBool isSilent = false.obs;
  final RxBool isRead = false.obs;

  @override
  void onReady() {
    final List<ChatModel> chatModel = <ChatModel>[
      ChatModel("Mallika", "person.svg", false, "4:00", "Hello", "", false, 1),
      ChatModel("Apurva", "person.svg", false, "3:00", "Hi Rosy", "", false, 1),
      ChatModel("Nagy", "person.svg", false, "6:00", "Hello, How are you", "",
          false, 1),
      ChatModel(
          "Deepak", "person.svg", false, "5:00", "I am good", "", false, 1),
      ChatModel("Priti", "person.svg", false, "4:00", "Hope, ypu are well", "",
          false, 1),
      ChatModel("Mallika", "person.svg", false, "4:00", "Hello", "", false, 1),
      ChatModel("Apurva", "person.svg", false, "3:00", "Hi Rosy", "", false, 1),
      ChatModel("Nagy", "person.svg", false, "6:00", "Hello, How are you", "",
          false, 1),
      ChatModel(
          "Deepak", "person.svg", false, "5:00", "I am good", "", false, 1),
      ChatModel("Priti", "person.svg", false, "4:00", "Hope, ypu are well", "",
          false, 1),
    ];
    chatList.addAll(chatModel);

    super.onReady();
  }
}
