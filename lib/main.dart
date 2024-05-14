import 'package:feburary_flutter/localization/language/languages.dart';
import 'package:feburary_flutter/screens/CameraPermissionHandle.dart';
import 'package:feburary_flutter/screens/refer_a_friend/view/refer_a_friend_screen.dart';
import 'package:feburary_flutter/screens/login/view/LoginScreen.dart';
import 'package:feburary_flutter/screens/my_profile/view/MyProfileScreen.dart';
import 'package:feburary_flutter/screens/otp/view/otp_view/OTPScreen.dart';
import 'package:feburary_flutter/screens/PermisionHandlreScreen.dart';
import 'package:feburary_flutter/theme/AppThemes.dart';
import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:feburary_flutter/utility/router/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'DisbursedCustomCard.dart';
import 'localization/locale_constant.dart';
import 'localization/localizations_delegte.dart';
import 'models/BottomNavigation.dart';
import 'models/GridViewLayout.dart';
import 'models/TotalOverDueCard.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  late Locale _locale = Locale("");

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: AppColors.appBarColor,
    //     systemNavigationBarIconBrightness : Brightness.dark
    //
    // ));
    return GetMaterialApp(
      title: 'Multi Language',
      // darkTheme: AppThemes.dark,
      // themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      locale: _locale,
      getPages: Routes.pages,
      // home:
      // CameraPermissionHandle(),
      // PermissionHandlerScreen(),
      //   CreditProfile(),
      // OTPScreen(),
      // MyProfileScreen(),
      supportedLocales: const [
        Locale('en', ''),
        Locale('hi', ''),
        Locale('gu', ''),
        Locale('ta', '')
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
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
      home: LoginScreen(),
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(42, 69, 130, 50),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
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
                              child: Icon(Icons.notifications,
                                  color: Colors.white),
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
                      const Text("Quick Actions",
                          style: TextStyle(color: Colors.black)),
                      const SizedBox(height: 10),
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("")
                          // GridViewLayout(callback: onCalledFromOutside)
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // extendBody: true,
      bottomNavigationBar: const BottomNavigation(),
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
