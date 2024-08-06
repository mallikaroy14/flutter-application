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
          body: Stack(children: [
        Obx(() {
          if (!controller.isInitialized.value) {
            return Center(child: CircularProgressIndicator());
          }
          return CameraPreview(controller.cameraController);
        }),
        Positioned(
          top: 15,
          left: 15,
          child: CircleAvatar(
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
        ),
        Positioned(
          top: 15,
          right: 15,
          child: CircleAvatar(
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
        ),
        Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: Get.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.flash = !controller.flash;
                          controller.toggleFlash;
                        },
                        icon: controller.flash
                            ? Icon(Icons.flash_on)
                            : Icon(Icons.flash_off),
                        color: AppColors.whiteColor,
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
                          XFile videopath = await controller.cameraController
                              .stopVideoRecording();
                          controller.isRecoring = false;
                        },
                        child: controller.isRecoring
                            ? Icon(Icons.radio_button_on,
                                color: AppColors.redColor, size: 80)
                            : Icon(Icons.panorama_fish_eye,
                                color: AppColors.whiteColor, size: 70),
                      ),
                      IconButton(
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
                          ))
                    ],
                  )
                ],
              ),
            ))
      ])),
    );
    return super.builder();
  }
}
