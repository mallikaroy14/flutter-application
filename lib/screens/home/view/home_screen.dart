import 'package:feburary_flutter/screens/home/controller/HomeController.dart';
import 'package:feburary_flutter/screens/pay_EMI/view/Pay_EMIScreen.dart';
import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:feburary_flutter/utility/router/route_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../DisbursedCustomCard.dart';
import '../../../models/BottomNavigation.dart';
import '../../../models/GridViewLayout.dart';
import '../../../models/TotalOverDueCard.dart';
import '../../../models/data.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              appBarWidget(context),
              TotalOverDueCard(callback: callBackFromPayNow),
              Container(
                  decoration: const BoxDecoration(
                      color: AppColors.homeBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
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
                            gridViewLayout(context, (callBackText) {
                              if (kDebugMode) {
                                print(callBackText);
                              }
                            }),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1.5,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1))
                            ],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0))),
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        border: Border.all(
                                            color: Colors.orange, width: 1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15))),
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 20),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Refer your friend",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.hintColor),
                                              ),
                                              Text(
                                                "Refer a friend friend for Loan with Vridhi.",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: AppColors.hintColor),
                                              ),
                                              Text("Click Here >",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors
                                                          .orangeColor)),
                                            ]),
                                        Image(
                                            image: AssetImage(
                                                "images/ic_vridhi.png"),
                                            width: 80,
                                            height: 80)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                gridViewWithDivider((gridText) {
                                  if (gridText == "My Profile") {
                                    Get.toNamed(RouteName.myProfileScreen);
                                  } else if (gridText == "refer a friend") {
                                    Get.toNamed(RouteName.referAFriend);
                                  } else if (gridText == "Loan Summary") {
                                    Get.toNamed(RouteName.loanSummaryScreen);
                                  }
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        // extendBody: true,
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }

  Row appBarWidget(BuildContext context) {
    return Row(
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
                    child: const Icon(Icons.notifications, color: Colors.white),
                    onTap: () {
                      //action code when clicked
                      if (kDebugMode) {
                        print("The icon is clicked");
                      }
                    },
                  ),
                  InkWell(
                    child: const Icon(Icons.phone, color: Colors.white),
                    onTap: () {
                      buildShowModalBottomSheet(context);
                    },
                  ),
                  InkWell(
                    child: const Icon(Icons.face, color: Colors.white),
                    onTap: () {
                      //action code when clicked
                      if (kDebugMode) {
                        print("The icon is clicked");
                      }
                    },
                  ),
                ]),
          )
        ]);
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: 80,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 20, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Get In Touch",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.close))
                          ],
                        ),
                        const Text(
                          "If you have Any Enquires Get In Touch With Us. We will be happy to Help you.",
                          style: TextStyle(
                              color: AppColors.grayColor, fontSize: 13),
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1, color: AppColors.grayColor),
                        SizedBox(height: 10),
                        Text(
                          "Via Call",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                                onPressed: () async {
                                  await callOnMobileNumber();
                                  // launchUrlString("+918210415010");
                                },
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: AppColors.primaryColor),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0))),
                                child: const Text(
                                  "867868766986",
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Future<void> callOnMobileNumber() async {
    final call = Uri.parse("tel:+918210415010");
    if (await canLaunchUrl(call)) {
      launchUrl(call, mode: LaunchMode.externalApplication);
      Get.back();
    } else {
      throw 'Could not launch $call';
    }
  }

  Container gridViewWithDivider(void Function(String) callBack) {
    return Container(
      color: Colors.grey,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemCount: _photos.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  callBack(_photos[index].text);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 20,
                      color: Colors.yellow[900],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _photos[index].text,
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void onCalledFromOutside(String text) {
    if (kDebugMode) {
      print("Call from grid card $text");
    }
  }

  void callBackFromPayNow() {
    if (kDebugMode) {
      Get.to(PayEmiScreen());
    }
  }

  void callBackFromDisbursement(String text) {
    if (kDebugMode) {
      print("Call from card $text");
    }
  }
}

final List _photos = [
  Data("My Profile", "images/logo.png"),
  Data("refer a friend", "images/logo.png"),
  Data("Loan Summary", "images/logo.png"),
  Data("Part", "images/logo.png"),
  Data("disbursement", "images/logo.png"),
  Data("Last2 ", "images/logo.png"),
  Data("Last ", "images/logo.png"),
  Data("Part ", "images/logo.png"),
  Data("Part", "images/logo.png"),
  Data("disbursement", "images/logo.png"),
  Data("Last2 ", "images/logo.png"),
  Data("Last ", "images/logo.png")
];
