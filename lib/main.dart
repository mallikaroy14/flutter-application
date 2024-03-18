import 'package:flutter/material.dart';
import 'DisbursedCustomCard.dart';
import 'models/BottomNavigation.dart';
import 'models/GridViewLayout.dart';
import 'models/TotalOverDueCard.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(42, 69, 130, 50),

      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(42, 69, 130, 50)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
      return SafeArea(
      child: Scaffold(
          // appBar: AppBar(backgroundColor: Color.fromRGBO(42, 69, 130, 50)),
          backgroundColor: Color.fromRGBO(42, 69, 130, 50),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Hi Payal",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20)),
                          Text("Last login at 23-01-2024, 12.00.00",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 10.0, bottom: 10.0, right: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              child:
                                  Icon(Icons.notifications, color: Colors.white),
                              onTap: () {
                                //action code when clicked
                                print("The icon is clicked");
                              },
                            ),
                            InkWell(
                              child: Icon(Icons.phone, color: Colors.white),
                              onTap: () {
                                //action code when clicked
                                print("The icon is clicked");
                              },
                            ),
                            InkWell(
                              child: Icon(Icons.face, color: Colors.white),
                              onTap: () {
                                //action code when clicked
                                print("The icon is clicked");
                              },
                            ),
                          ]),
                    )
                  ]),
              TotalOverDueCard(callback: callBackFromPayNow),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DisbursedCustomCard(
                          description: "Disbursment",
                          count: 2,
                          callback: callBackFromDisbursement),
                      const SizedBox(height: 10),
                      DisbursedCustomCard(
                          description: "In-progress",
                          count: 10,
                          callback: callBackFromDisbursement),
                      const SizedBox(height: 10),
                      const Text("Title comes here",
                          style: TextStyle(color: Colors.black)),
                      const SizedBox(height: 10),
                      GridViewLayout(callback: onCalledFromOutside),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        extendBody: true,
        bottomNavigationBar:  const BottomNavigation(),
      ),
    );
  }

  void onCalledFromOutside(String text) {
    print("Call from grid card $text");
  }

  void callBackFromPayNow() {
    print("Call from Pay now");
  }

  void callBackFromDisbursement(String text) {
    print("Call from card $text");
  }
}
