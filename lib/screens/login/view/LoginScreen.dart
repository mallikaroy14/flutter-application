import 'package:feburary_flutter/screens/login/controller/login_controller.dart';
import 'package:feburary_flutter/screens/otp/view/otp_view/OTPScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../localization/language/languages.dart';
import '../../../theme/app_colors.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 27, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                      image: AssetImage("images/ic_vridhi.png"),
                      width: 100,
                      height: 100),
                  Text(Languages.of(context)?.stringPleaseLogin ?? "",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(Languages.of(context)?.stringWelcomeBack ?? "",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.normal)),
                  const SizedBox(
                    height: 15,
                  ),
                  // _createLanguageDropDown(),

                  SizedBox(
                      height: 55,
                      child: TextFormField(
                        validator: (value) {},
                        decoration: InputDecoration(
                          label: RichText(
                            text: const TextSpan(
                                text: "Mobile Number",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          hintStyle: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          labelStyle: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                        keyboardType: TextInputType.phone,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _LoginScreenState extends State<LoginScreen> {
//   String _data = "";
//
//   static const MethodChannel methodChannel =
//       MethodChannel('samples.flutter.dev/mychannel');
//   static const String methodName = "apicall";
//
//   Future<void> makeApiCall() async {
//     try {
//       String s = await methodChannel.invokeMethod(methodName);
//       if (s.isNotEmpty) {
//         _data = s;
//       } else {
//         _data = "not data found";
//       }
//       setState(() {});
//     } on PlatformException catch (e) {
//       debugPrint("Failed to Invoke: '${e.message}'.");
//     }
//   }
//
//
//
//   _createLanguageDropDown() {
//     return DropdownButton<LanguageData>(
//       iconSize: 30,
//       hint: Text(Languages.of(context)?.labelSelectLanguage ?? ""),
//       items: LanguageData.languageList()
//           .map<DropdownMenuItem<LanguageData>>(
//             (e) => DropdownMenuItem<LanguageData>(
//               value: e,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[Text(e.name)],
//               ),
//             ),
//           )
//           .toList(),
//       onChanged: (LanguageData? language) {
//         changeLanguage(context, language?.languageCode ?? "");
//       },
//     );
//   }
// }