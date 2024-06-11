import 'package:feburary_flutter/screens/dashboard/binding/dashboardBinding.dart';
import 'package:feburary_flutter/screens/dashboard/view/dashBoardview.dart';
import 'package:feburary_flutter/screens/home/binding/HomeBinding.dart';
import 'package:feburary_flutter/screens/loan_summary/binding/loan_summary_binding.dart';
import 'package:feburary_flutter/screens/loan_summary/view/loan_summary_screen.dart';
import 'package:feburary_flutter/screens/login/binding/login_binding.dart';
import 'package:feburary_flutter/screens/my_profile/binding/my_profile_binding.dart';
import 'package:feburary_flutter/screens/otp/binding/otp_binding.dart';
import 'package:feburary_flutter/screens/pay_EMI/binding/pay_emi_binding.dart';
import 'package:feburary_flutter/screens/pay_EMI/controller/pay_emi_controller.dart';
import 'package:feburary_flutter/screens/pay_EMI/view/Pay_EMIScreen.dart';
import 'package:feburary_flutter/screens/refer_a_friend/binding/refer_a_friend_binding.dart';
import 'package:feburary_flutter/screens/refer_a_friend/view/refer_a_friend_screen.dart';
import 'package:feburary_flutter/screens/login/view/LoginScreen.dart';
import 'package:feburary_flutter/screens/my_profile/view/MyProfileScreen.dart';
import 'package:feburary_flutter/screens/otp/view/otp_view/OTPScreen.dart';
import 'package:feburary_flutter/screens/home/view/home_screen.dart';
import 'package:feburary_flutter/screens/self_service/binding/self_service_binding.dart';
import 'package:feburary_flutter/screens/self_service/view/self_service_screen.dart';
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
    GetPage(
        name: RouteName.loginScreen,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: RouteName.otpScreen,
        page: () => OTPScreen(),
        binding: OTPBinding()),
    GetPage(
        name: RouteName.dashboardScreen,
        page: () => DashboardScreen(),
        binding: Dashboardbinding()),
    GetPage(
        name: RouteName.homeScreen,
        page: () => HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: RouteName.myProfileScreen,
        page: () => MyProfileScreen(),
        binding: MyPrpfileBinding()),
    GetPage(
        name: RouteName.creditProfileScreen,
        page: () => ReferAFriend(),
        binding: ReferAFriendBinding()),
    GetPage(
        name: RouteName.payEmiScreen,
        page: () => PayEmiScreen(),
        binding: PayEmiBinding()),
    GetPage(
        name: RouteName.referAFriend,
        page: () => ReferAFriend(),
        binding: ReferAFriendBinding()),
    GetPage(
        name: RouteName.loanSummaryScreen,
        page: () => LoanSummaryScreen(),
        binding: LoanSummaryBinding()),
    GetPage(
        name: RouteName.selfServiceScreen,
        page: () => SelfServiceScreen(),
        binding: SelfServiceBinding())


  ];
}
