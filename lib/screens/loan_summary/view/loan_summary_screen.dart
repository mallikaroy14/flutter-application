import 'package:feburary_flutter/screens/loan_summary/controller/loan_summary_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../localization/language/languages.dart';
import '../../../theme/app_colors.dart';
import '../../login/controller/login_controller.dart';
import '../../otp/view/otp_view/OTPScreen.dart';

class LoanSummaryScreen extends GetView<LoanSummaryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      // appBar: AppBar(
      // backgroundColor: AppColors.appBarColor),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          height: 60,
          margin: const EdgeInsets.all(10),
          child: Container(
            margin: EdgeInsets.all(5),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Get.to(OTPScreen());
              },
              child: const Text("Send OTP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500)),
            ),
          )),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: const Image(
                    image: AssetImage("images/ic_vridhi.png"),
                    width: 100,
                    height: 100),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(Languages.of(context)?.stringPleaseLogin ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Text(Languages.of(context)?.stringWelcomeBack ?? "",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1.5,
                          blurRadius: 1,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                // child: Text("Hello")
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 15),
                  child: Text("Loan Summary Screen")
                ),
              ),
            ],
          )),
    );
  }
}
