import 'package:feburary_flutter/models/languageData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../localization/language/languages.dart';
import '../localization/locale_constant.dart';

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
      appBar: AppBar(backgroundColor: const Color.fromRGBO(254, 251, 241, 100)),
      backgroundColor: const Color.fromRGBO(254, 251, 241, 100),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () => {
                // makeApiCall()
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  minimumSize: const Size(double.infinity, 50)),
              child: const Text("Send OTP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)))),
      body: Center(
        child: Column(
          children: [
             Text(Languages.of(context)?.stringWelcomeBack?? "",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
             Text(Languages.of(context)?.stringPleaseLogin ?? "",
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 70,
            ),
            // _createLanguageDropDown(),
            Expanded(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
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