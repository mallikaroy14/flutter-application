import 'package:feburary_flutter/screens/refer_a_friend/controller/refer_a_friend_controller.dart';
import 'package:get/get.dart';

class ReferAFriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReferAFriendController());
  }
}
