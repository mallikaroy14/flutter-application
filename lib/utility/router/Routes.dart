import 'package:feburary_flutter/screens/refer_a_friend/view/refer_a_friend_screen.dart';
import 'package:feburary_flutter/screens/login/view/LoginScreen.dart';
import 'package:feburary_flutter/screens/my_profile/view/MyProfileScreen.dart';
import 'package:feburary_flutter/screens/otp/view/otp_view/OTPScreen.dart';
import 'package:feburary_flutter/screens/home/view/home_screen.dart';
import 'package:feburary_flutter/screens/splash/binding/SplashBiding.dart';
import 'package:feburary_flutter/screens/splash/view/SplashScreen.dart';
import 'package:get/get.dart';
import 'route_name.dart';

class Routes {
  static final pages = [
    GetPage(
        name: RouteName.splashScreen,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(name: RouteName.loginScreen, page: () => LoginScreen()),
    GetPage(name: RouteName.otpScreen, page: () => OTPScreen()),
    GetPage(name: RouteName.homeScreen, page: () => HomeScreen()),
    GetPage(name: RouteName.myProfileScreen, page: () => MyProfileScreen()),
    GetPage(name: RouteName.creditProfileScreen, page: () => ReferAFriend()),
  ];
}