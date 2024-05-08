import 'package:feburary_flutter/screens/LoginScreen.dart';
import 'package:feburary_flutter/utility/router/Routes.dart';
import 'package:feburary_flutter/utility/router/route_name.dart';
import 'package:get/get.dart';

class SplashController extends SuperController{

  @override
  void onInit() {
    super.onInit();
    openLoginScreen();
  }

  @override
  void onDetached() {
  }

  @override
  void onHidden() {
  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {
  }

  @override
  void onResumed() {
  }

  void openLoginScreen() async{
   await Future.delayed(Duration(seconds: 2), () async {
     Get.offNamed(RouteName.loginScreen);
   } );
  }

}