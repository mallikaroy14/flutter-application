import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:feburary_flutter/whatsapp/status/controller/status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/router/route_name.dart';


class StatusScreen extends GetResponsiveView<StatusController> {
  StatusScreen({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      body: Container(
        color: AppColors.whiteColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 50,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(child: Icon(Icons.person)),
                        Positioned(
                            right: 6,
                            bottom: 0,
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(color: Colors.white),
                                ),
                                onPressed: () {
                                  Get.toNamed(RouteName.camera);
                                },
                                child: CircleAvatar(
                                    radius: 20,
                                    child: Icon(Icons.add)),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("My Status",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text("Tap to add status update",
                          style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.statusGreyColor,
              width: Get.width,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Recent updates",
                      style: TextStyle(
                          color: AppColors.darkGreyColor,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        CircleAvatar(child: Icon(Icons.person)),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mallika Roy",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text("Today, 14:00",
                                style: TextStyle(fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            Container(
              color: AppColors.statusGreyColor,
              width: Get.width,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Viewed updates",
                      style: TextStyle(
                          color: AppColors.darkGreyColor,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.person,
                    ),
                    radius: 20,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Apurva Roy",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text("Today, 02:00", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
