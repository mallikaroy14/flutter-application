import 'package:feburary_flutter/screens/dashboard/controller/dashboardController.dart';
import 'package:get/get.dart';

class Dashboardbinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}