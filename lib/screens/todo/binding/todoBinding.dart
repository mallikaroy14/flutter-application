import 'package:feburary_flutter/screens/todo/controller/todoController.dart';
import 'package:feburary_flutter/utility/router/route_name.dart';
import 'package:get/get.dart';

class TodoBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(TodoController());
  }
}