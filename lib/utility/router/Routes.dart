import 'package:feburary_flutter/screens/LoginScreen.dart';
import 'package:feburary_flutter/screens/splash/binding/SplashBiding.dart';
import 'package:feburary_flutter/screens/splash/view/SplashScreen.dart';
import 'package:get/get.dart';
import 'route_name.dart';

class Routes {
  static final pages = [
    GetPage(name: RouteName.splashScreen, page: () => SplashScreen(), binding: SplashBinding()),
    GetPage(name: RouteName.loginScreen, page: () => LoginScreen())
  ];
}