import 'package:feburary_flutter/screens/MyProfileScreen.dart';
import 'package:feburary_flutter/screens/home/controller/HomeController.dart';
import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../DisbursedCustomCard.dart';
import '../../../models/BottomNavigation.dart';
import '../../../models/GridViewLayout.dart';
import '../../../models/TotalOverDueCard.dart';
import '../../../models/data.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                            GridViewLayout(context, (callBackText) {
                              print(callBackText);
                            }),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1.5,
                                  blurRadius: 1,
                                  offset: Offset(0, 1))
                            ],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0))),
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          border: Border.all(
                                              color: Colors.orange, width: 1),
                                          borderRadius: BorderRadius.all(
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
                                                        color:
                                                            AppColors.orangeColor)),
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
                                ),
                                SizedBox(height: 10,),
                                GridViewWithDivider((gridText){
                                  if(gridText == "My Profile")
                                  Get.to(MyProfileScreen());

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

  Container GridViewWithDivider(void Function(String) callBack) {
    return Container(
      color: Colors.grey,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemCount: _photos.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              child: InkWell(
                onTap: (){
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _photos[index].text,
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            );
          }),
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

final List _photos = [
  Data("My Profile", "images/logo.png"),
  Data("Hello", "images/logo.png"),
  Data("Part ", "images/logo.png"),
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
