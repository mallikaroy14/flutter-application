import 'package:feburary_flutter/screens/home/view/home_screen.dart';
import 'package:feburary_flutter/screens/otp/controller/otp_controller.dart';
import 'package:feburary_flutter/utility/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../theme/app_colors.dart';

class OTPScreen extends GetView<OTPController> {
  @override
  Widget build(BuildContext context) {
    String mobileNumber = "XXXXXXX7810";

    final defaultThemePin = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor,
          fontFamily: 'Lato'),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grayColor),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(top: 27, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                  image: AssetImage("images/ic_vridhi.png"),
                  width: 100,
                  height: 100),
              const Text("Enter OTP",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(
                height: 8,
              ),
              Text(
                  "We have sent an OTP to your registered mobile number $mobileNumber",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey)),
              const SizedBox(
                height: 30,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 13, right: 17),
              //   child:
                Center(
                  child: Obx(() => Pinput(
                    length: 4,
                    forceErrorState: controller.pinValid.value,
                    focusNode: controller.pinFocusNode,
                    controller: controller.pinController,
                    defaultPinTheme: defaultThemePin,
                    focusedPinTheme: defaultThemePin.copyWith(
                      decoration: defaultThemePin.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.orangeColor),
                      ),
                    ),
                    submittedPinTheme: defaultThemePin.copyWith(
                      decoration: defaultThemePin.decoration!.copyWith(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.grayColor),
                      ),
                    ),
                    onCompleted: (pin) {
                      print('onCompleted: $pin');

                    },
                    onChanged: (value) {
                      print('onCompleted: $value');
                    },
                    errorPinTheme: defaultThemePin.copyBorderWith(
                      border: Border.all(color: AppColors.redColor),
                    ),
                  )),
                ),
              // ),
              const SizedBox(
                height: 20,
              ),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Didn't receive a OTP?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                Text(" Resend OTP",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w400))
              ]),
              const SizedBox(
                height: 40,
              ),
              Obx(() => ElevatedButton(
                statesController: controller.stateController,
                style: ButtonStyle(
                    shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        controller.pinValid.value
                            ? AppColors.primaryColor
                            : AppColors.grayColor),
                    minimumSize: const MaterialStatePropertyAll(
                        Size(double.infinity, 50))),
                onPressed: controller.pinValid.value ? () {
                        if (controller.pinValid.value) {
                          print("pinValid:${controller.pinValid}");
                          Get.toNamed(RouteName.homeScreen);
                        }
                        print("IsPinValid:${controller.pinValid}");
                      }
                    : null,
                child: const Text("Verify & Proceed",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _textFieldOTP({required bool first, required bool last, required context}) {
    return SizedBox(
      height: 63,
      child: AspectRatio(
        aspectRatio: 0.9,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == true) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.deepOrangeAccent),
                  borderRadius: BorderRadius.circular(5))),
        ),
      ),
    );
  }
}
