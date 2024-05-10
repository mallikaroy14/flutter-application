import 'package:feburary_flutter/localization/languageData.dart';
import 'package:feburary_flutter/screens/OTPScreen.dart';
import 'package:feburary_flutter/utility/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../localization/language/languages.dart';
import '../localization/locale_constant.dart';
import '../theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _data = "";

  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.dev/mychannel');
  static const String methodName = "apicall";

  Future<void> makeApiCall() async {
    try {
      String s = await methodChannel.invokeMethod(methodName);
      if (s.isNotEmpty) {
        _data = s;
      } else {
        _data = "not data found";
      }
      setState(() {});
    } on PlatformException catch (e) {
      debugPrint("Failed to Invoke: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          height: 60,
          margin: const EdgeInsets.all(10),
          child:
          Container(
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
          )
      ),
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

                  Image(image: AssetImage("images/ic_vridhi.png"),width: 100, height: 100)
                  ,
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
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            // _createLanguageDropDown(),
            Expanded(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1.5,
                              blurRadius: 1,
                              offset: Offset(0, 1))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0))),
                    padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: const Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: "Mobile Number",
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  _createLanguageDropDown() {
    return DropdownButton<LanguageData>(
      iconSize: 30,
      hint: Text(Languages.of(context)?.labelSelectLanguage?? ""),
      items: LanguageData.languageList()
          .map<DropdownMenuItem<LanguageData>>(
            (e) => DropdownMenuItem<LanguageData>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[Text(e.name)],
              ),
            ),
          )
          .toList(),
      onChanged: (LanguageData? language) {
        changeLanguage(context, language?.languageCode ?? "");
      },
    );
  }
}