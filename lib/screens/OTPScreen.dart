import 'package:feburary_flutter/screens/MyProfileScreen.dart';
import 'package:feburary_flutter/screens/home/view/HomeScreen.dart';
import 'package:feburary_flutter/utility/router/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../theme/app_colors.dart';

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String mobileNumber = "XXXXXXX7810";

    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 27, left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage("images/ic_vridhi.png"),width: 100, height: 100),
            const Text("Enter OTP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(
              height: 8,
            ),
            Text(
                "We have sent an OTP to your registered mobile number $mobileNumber",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey)),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textFieldOTP(first: true, last: false, context: context),
                  _textFieldOTP(first: true, last: false, context: context),
                  _textFieldOTP(first: true, last: false, context: context),
                  _textFieldOTP(first: true, last: true, context: context)
                ],
              ),
            ),
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
            Container(
              // margin: EdgeInsets.all(5),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Get.to(HomeScreen());
                },
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
    );
  }

  _textFieldOTP({required bool first, required bool last, required context}) {
    return Container(
      height: 63,
      child: AspectRatio(
        aspectRatio: 0.9,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == true) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
