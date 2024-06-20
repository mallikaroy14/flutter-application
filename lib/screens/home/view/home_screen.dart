import 'package:feburary_flutter/screens/home/controller/HomeController.dart';
import 'package:feburary_flutter/screens/pay_EMI/view/Pay_EMIScreen.dart';
import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:feburary_flutter/utility/router/route_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../DisbursedCustomCard.dart';
import '../../../models/GridViewLayout.dart';
import '../../../models/TotalOverDueCard.dart';
import '../../../models/data.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,

        title:
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Priya!",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
            Text("Last login at 23-01-2024",
                style: TextStyle(
                    color: AppColors.grayColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12))
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
                onTap: () {},
                child: const Icon(Icons.phone, color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Icon(Icons.language, color: Colors.white),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Icon(Icons.notifications_none_sharp,
                  color: Colors.white),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
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
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          DisbursedCustomCard(
                              description: "Rejected",
                              count: 5,
                              callback: callBackFromDisbursement),
                          const SizedBox(height: 10),
                          const Text("Quick Actions",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                          gridViewLayout(context, (callBackText) {
                            if (callBackText == "Request Disbursement") {
                              bottomSheetRequestDisbursement();
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
    );
  }

  final List<Map<String, String>> items = [
    {"title": "131410005", "description": "Loan account"},
    {"title": "131410006", "description": "Loan account"},
  ];

  void bottomSheetRequestDisbursement() {
    Get.bottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColors.whiteColor,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: 80,
                decoration: const BoxDecoration(
                    color: AppColors.grayColor,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Select loan for disbursement",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 17,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Obx(
                              () => Card.outlined(
                                color: Colors.white,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: AppColors.cardHeader,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15.0),
                                                topRight: Radius.circular(15.0))),
                                        child: ListTile(
                                          dense: true,
                                          contentPadding:
                                              EdgeInsets.only(left: 10),
                                          title: Text(
                                            items[index]["title"]!,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackColor),
                                          ),
                                          subtitle: Text(
                                            items[index]["description"]!,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.grayColor),
                                          ),
                                          trailing: Radio<int>(
                                            value: index,
                                            activeColor: AppColors.primaryColor,
                                            groupValue: controller
                                                .selectedRadioValue.value,
                                            onChanged: (int? value) {
                                              controller.selectedRadioValue
                                                  .value = value!;
                                              if (kDebugMode) {
                                                print(
                                                    "SelectedRadioButton: $controller.selectedRadioValue.value");
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      radioexpandedwidget(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    nextButton()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  SizedBox nextButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            backgroundColor:
                const WidgetStatePropertyAll(AppColors.primaryColor)),
        onPressed: () {
          print("Button Clicked");
        },
        child: const Text("Next",
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500)),
      ),
    );
  }

  Padding radioexpandedwidget() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date of 1st disburstment",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: AppColors.grayColor,
                          fontSize: 13),
                    ),
                    Text(
                      "13-08-2023",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          fontSize: 12),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining disbursable amount",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        "Rs 40,0000",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.blackColor,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sanction Amount",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: AppColors.grayColor,
                          fontSize: 13),
                    ),
                    Text(
                      "Rs 80,0000",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          fontSize: 12),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "OverDue amount",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        "Rs 50,0000",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.blackColor,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
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
                                icon: const Icon(Icons.close))
                          ],
                        ),
                        const Text(
                          "If you have Any Enquires Get In Touch With Us. We will be happy to Help you.",
                          style: TextStyle(
                              color: AppColors.grayColor, fontSize: 13),
                        ),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1, color: AppColors.grayColor),
                        const SizedBox(height: 10),
                        const Text(
                          "Via Call",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor),
                        ),
                        const SizedBox(height: 10),
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
      Get.to(const PayEmiScreen());
    }
  }

  void callBackFromDisbursement(String text) {
    if (kDebugMode) {
      if(text.contains("Rejected")){
        Get.toNamed(RouteName.rejectedLoanSummary);
      }
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
