import 'package:camera/camera.dart';
import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/camera_screen_controller.dart';

class Camera extends GetResponsiveView<CameraScreenController> {
  Camera({super.key});

  @override
  Widget? builder() {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: Get.height,
        child: Stack(fit: StackFit.expand, children: [
          Obx(() {
            if (!controller.isInitialized.value) {
              return Center(child: CircularProgressIndicator());
            }
            return CameraPreview(controller.cameraController);
          }),
          Positioned(
            top: 15,
            child: Container(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.blackColor.withOpacity(0.4),
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: AppColors.whiteColor,
                            size: 25,
                          ),
                        ),
                      ),
                      controller.isVideo.isTrue
                          ? Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.blackColor.withOpacity(0.4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text("00:00",
                                  style:
                                      TextStyle(color: AppColors.whiteColor)))
                          : SizedBox(),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.blackColor.withOpacity(0.4),
                        child: IconButton(
                          onPressed: () {
                            controller.flash = !controller.flash;
                            controller.toggleFlash;
                          },
                          icon: controller.flash
                              ? Icon(Icons.flash_on)
                              : Icon(Icons.flash_off),
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 100,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: Get.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 100,
                                color: AppColors.primaryColor,
                                child: Image.asset('images/flower1.jpeg'),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    width: Get.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    AppColors.blackColor.withOpacity(0.4),
                                child: Icon(
                                  size: 28,
                                  Icons.image_outlined,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onLongPress: () async {
                                await controller.cameraController
                                    .startVideoRecording();
                                controller.isRecoring = true;
                              },
                              onTap: () {
                                if (!controller.isRecoring) {
                                  controller.takePhoto();
                                }
                              },
                              onLongPressUp: () async {
                                XFile videopath = await controller
                                    .cameraController
                                    .stopVideoRecording();
                                controller.isRecoring = false;
                              },
                              child: controller.isRecoring
                                  ? Icon(Icons.radio_button_on,
                                      color: AppColors.redColor, size: 80)
                                  : Icon(Icons.radio_button_on,
                                      color: AppColors.whiteColor, size: 80),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    AppColors.blackColor.withOpacity(0.4),
                                child: IconButton(
                                    onPressed: () {
                                      controller.cameraToggle;
                                    },
                                    icon: Transform.rotate(
                                      angle: controller.transform,
                                      child: Icon(
                                        Icons.flip_camera_ios,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: 70,
                  color: AppColors.blackColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isVideo.value = true;
                        },
                        child: Text(
                          "Video",
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          controller.isVideo.value = false;
                        },
                        child: Text("Photo",
                            style: TextStyle(color: AppColors.whiteColor)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      )),
    );
    return super.builder();
  }
}
