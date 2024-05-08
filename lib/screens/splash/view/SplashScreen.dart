import 'package:feburary_flutter/screens/splash/controller/SplashController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return const Image(
        image: AssetImage("images/splash.png"),
        width: double.infinity,
        height: double.infinity);
  }
}
