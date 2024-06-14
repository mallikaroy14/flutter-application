import 'package:feburary_flutter/screens/dashboard/controller/dashboardController.dart';
import 'package:feburary_flutter/screens/home/view/home_screen.dart';
import 'package:feburary_flutter/screens/requests/controller/requests_controller.dart';
import 'package:feburary_flutter/screens/requests/view/requests_screen.dart';
import 'package:feburary_flutter/screens/self_service/controller/self_service_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../self_service/view/self_service_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {

    Get.put(SelfServiceController());
    Get.put(RequestsController());

    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomeScreen(),
              RequestsScreen(),
              SelfServiceScreen(),
            ],
          ),
        ),
        // extendBody: true,
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.deepOrangeAccent,
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                icon: Icon(Icons.request_page_rounded),
                backgroundColor: Colors.white,
                label: "Requests",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.design_services),
                  label: "Self Service",
                  backgroundColor: Colors.white),
            ],
            showUnselectedLabels: true,
            elevation: 100,
            currentIndex: controller.tabIndex.value,
            onTap: (index) {
              controller.changeTabIndex(index);
              if (kDebugMode) {
                print("index: $index");
              }
            },
          ),
        ));
  }
}
