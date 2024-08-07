import 'package:feburary_flutter/screens/dashboard/binding/dashboardBinding.dart';
import 'package:feburary_flutter/screens/dashboard/view/dashBoardview.dart';
import 'package:feburary_flutter/screens/home/binding/HomeBinding.dart';
import 'package:feburary_flutter/screens/loan_summary/binding/loan_summary_binding.dart';
import 'package:feburary_flutter/screens/loan_summary/view/loan_summary_screen.dart';
import 'package:feburary_flutter/screens/login/binding/login_binding.dart';
import 'package:feburary_flutter/screens/my_profile/binding/my_profile_binding.dart';
import 'package:feburary_flutter/screens/new_request/binding/create_new_requestBinding.dart';
import 'package:feburary_flutter/screens/new_request/view/create_new_request.dart';
import 'package:feburary_flutter/screens/otp/binding/otp_binding.dart';
import 'package:feburary_flutter/screens/pay_EMI/binding/pay_emi_binding.dart';
import 'package:feburary_flutter/screens/pay_EMI/view/Pay_EMIScreen.dart';
import 'package:feburary_flutter/screens/pendencie_detail/binding/pendencies_details_binding.dart';
import 'package:feburary_flutter/screens/pendencie_detail/view/pendencies_details_screen.dart';
import 'package:feburary_flutter/screens/pendencies/binding/pendencies_binding.dart';
import 'package:feburary_flutter/screens/pendencies/view/pendencies_screen.dart';
import 'package:feburary_flutter/screens/refer_a_friend/binding/refer_a_friend_binding.dart';
import 'package:feburary_flutter/screens/refer_a_friend/view/refer_a_friend_screen.dart';
import 'package:feburary_flutter/screens/login/view/LoginScreen.dart';
import 'package:feburary_flutter/screens/my_profile/view/MyProfileScreen.dart';
import 'package:feburary_flutter/screens/otp/view/otp_view/OTPScreen.dart';
import 'package:feburary_flutter/screens/home/view/home_screen.dart';
import 'package:feburary_flutter/screens/rejected_loan_summary/binding/rejected_loan_summary_binding.dart';
import 'package:feburary_flutter/screens/rejected_loan_summary/view/rejected_loan_summary_screen.dart';
import 'package:feburary_flutter/screens/requests/view/requests_screen.dart';
import 'package:feburary_flutter/screens/self_service/binding/self_service_binding.dart';
import 'package:feburary_flutter/screens/self_service/view/self_service_screen.dart';
import 'package:feburary_flutter/screens/splash/binding/SplashBiding.dart';
import 'package:feburary_flutter/screens/splash/view/SplashScreen.dart';
import 'package:feburary_flutter/screens/todo/binding/todoBinding.dart';
import 'package:feburary_flutter/screens/todo/view/todoScreen.dart';
import 'package:feburary_flutter/whatsapp/camera/binding/camera_binding.dart';
import 'package:feburary_flutter/whatsapp/camera/view/camera.dart';
import 'package:feburary_flutter/whatsapp/chat_page/binding/chat_binding.dart';
import 'package:feburary_flutter/whatsapp/chat_page/view/chat_screen.dart';
import 'package:feburary_flutter/whatsapp/home/binding/chat_home_binding.dart';
import 'package:feburary_flutter/whatsapp/home/controller/chat_home_controller.dart';
import 'package:feburary_flutter/whatsapp/home/view/chat_home_screen.dart';
import 'package:feburary_flutter/whatsapp/select_contact/binding/select_contact_binding.dart';
import 'package:feburary_flutter/whatsapp/select_contact/view/select_contact_screen.dart';
import 'package:get/get.dart';
import '../../models/data.dart';
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
        binding: SelfServiceBinding()),
    GetPage(
        name: RouteName.requestsScreen,
        page: () => RequestsScreen(),
        binding: ReferAFriendBinding()),
    GetPage(
        name: RouteName.newServiceRequest,
        page: () => CreateNewRequest(),
        binding: CreateNewRequestBinding()),
    GetPage(
        name: RouteName.rejectedLoanSummary,
        page: () => RejectedLoanSummaryScreen(),
        binding: RejectedLoanSummaryBinding()),
    GetPage(
        name: RouteName.pendenciesScreen,
        page: () => PendenciesScreen(),
        binding: PendenciesBinding()),
    GetPage(
        name: RouteName.pendenciesDetails,
        arguments: PendenciesCardData,
        page: () => PendenciesDetailsScreen(),
        binding: PendenciesDetailsBinding()),
    GetPage(
        name: RouteName.todoScreen,
        page: () => TodoScreen(),
        binding: TodoBinding()),
    GetPage(
        name: RouteName.chatHomeScreen,
        page: () => ChatHomeScreen(),
        binding: ChatHomeBinding()),
    GetPage(
        name: RouteName.chatScreen,
        page: () => ChatScreen(),
        binding: ChatBinding()),
    GetPage(
        name: RouteName.selectContactScreen,
        page: () => SelectContactScreen(),
        binding: SelectContactBinding()),
    GetPage(
        name: RouteName.camera, page: () => Camera(), binding: CameraBinding()),
  ];
}
