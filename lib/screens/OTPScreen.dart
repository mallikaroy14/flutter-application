import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String mobileNumber = "XXXXXXX7810";

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter OTP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(
              height: 20,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _textFieldOTP(first: true, last: false, context: context),
                _textFieldOTP(first: true, last: false, context: context),
                _textFieldOTP(first: true, last: false, context: context),
                _textFieldOTP(first: true, last: true, context: context)
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Didn't receive a OTP?",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              Text(" Resend OTP",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.normal))
            ]),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(042, 068, 130, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
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
      height: 60,
      child: AspectRatio(
        aspectRatio: 0.8,
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
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
