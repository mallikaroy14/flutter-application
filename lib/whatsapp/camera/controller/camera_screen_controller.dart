import 'dart:math';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../CameraView.dart';

class CameraScreenController extends GetxController {
  late CameraController cameraController;
  late List<CameraDescription> cameras;

  // late Future<void> initializeControllerFuture;

  // var cameraController = Rxn<CameraController>();
  var isInitialized = false.obs;
  var isCameraOn = false.obs;
  bool flash = false;
  bool isRecoring = false;
  double transform = 0;
  bool iscamerafront = true;
  late Future<void> cameraValue;

  @override
  void onInit() {
    // cameraController = CameraController(cameras[0], ResolutionPreset.high);
    // initializeControllerFuture = cameraController.initialize();

    initializeCamera();
    super.onInit();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    await _requestPermissions();
    cameraController = CameraController(firstCamera, ResolutionPreset.medium);

    try {
      await cameraController.initialize();
      isInitialized.value = true;
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> cameraToggle() async {
    iscamerafront = !iscamerafront;
    transform = transform + pi;
    int cameraPos = iscamerafront ? 0 : 1;
    cameraController =
        CameraController(cameras[cameraPos], ResolutionPreset.high);
    cameraValue = cameraController.initialize();
  }

  Future<void> _requestPermissions() async {
    final cameraStatus = await Permission.camera.request();
    final storageStatus = await Permission.storage.request();

    if (cameraStatus.isDenied || storageStatus.isDenied) {
      // Handle denied permissions
      print('Permissions denied');
    }
  }

  // void toggleCamera() async {
  //   if (cameraController.value != null) {
  //     if (isCameraOn.value) {
  //       await cameraController.value!.dispose();
  //       isCameraOn.value = false;
  //     } else {
  //       await cameraController.value!.initialize();
  //       isCameraOn.value = true;
  //     }
  //   }
  // }

  void toggleFlash() async {
    flash
        ? cameraController.setFlashMode(FlashMode.torch)
        : cameraController.setFlashMode(FlashMode.off);
  }

  void takePhoto() async {
    XFile file = await cameraController.takePicture();

    Get.to(CameraViewPage(path: file.path));


  }

// Future<void> takePicture() async {
//   if (cameraController.value != null && isInitialized.value) {
//     try {
//       final image = await cameraController.value!.takePicture();
//       print('Picture saved to ${image.path}');
//     } catch (e) {
//       print('Error taking picture: $e');
//     }
//   }
// }
}
