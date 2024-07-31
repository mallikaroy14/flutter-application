import 'package:camera/camera.dart';
import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/camera_screen_controller.dart';

class Camera extends GetResponsiveView<CameraScreenController> {
  Camera({super.key});

  @override
  Widget? builder() {
    return Scaffold(
        body: Stack(children: [
      Obx(() {
        if (!controller.isInitialized.value) {
          return Center(child: CircularProgressIndicator());
        }

        return CameraPreview(controller.cameraController!);
      }),

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
                        await controller.cameraController.startVideoRecording();
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

      // FutureBuilder(
      //   future: controller.initializeControllerFuture,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return Container(
      //         width: Get.width,
      //         height: Get.height,
      //         child: CameraPreview(controller.cameraController),
      //       );
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    ]));
    return super.builder();
  }


}
