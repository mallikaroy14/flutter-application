import 'package:feburary_flutter/localization/language/languages.dart';
import 'package:feburary_flutter/models/data.dart';
import 'package:feburary_flutter/screens/my_profile/controller/my_profile_controller.dart';
import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../customUtility/CustomWidget.dart';
import '../../../localization/locale_constant.dart';
import '../../../localization/languageData.dart';

class MyProfileScreen extends GetView<MyProfileController> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final List listOfAddress = [
      ProfileAddress("Communication Address",
          "S-101, Marigold society near smart works, Kalyani Nagar, Pune(M.H), 411014"),
      ProfileAddress("Permanent Address",
          "S-101, Marigold society near smart works, Kalyani Nagar, Pune(M.H), 411014")
    ];

    final personalDetails = PersonalDetail(
      details: {
        'Name': 'John Doe',
        'Gender': 'Male',
        'Date Of Birth': '1990-05-15',
        'Mobile Number': '+1234567890',
        'Email ID': 'john.doe@example.com',
      },
    );

    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        titleSpacing: 0,
        title: const Text(
          "My Profile",
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.phone))],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                // child: Text("Hello")
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 15),
                  child: Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardView(
                            cardTitle: "Personal Details",
                            widget: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 10),
                              child: Center(
                                child: Column(
                                    children: personalDetails.details.entries
                                        .map((entry) => _buildKeyValuePair(
                                            entry.key, entry.value))
                                        .toList()),
                              ),
                            ),
                            showIcon: true,
                          ),
                          CardView(
                            cardTitle: "Address Details",
                            widget: Padding(
                              padding: EdgeInsets.only(
                                  top: 7, left: 15, right: 15, bottom: 10),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: listOfAddress.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 5, top: 5),
                                        child: Text(
                                            listOfAddress[index].addressType,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grayColor)),
                                      ),
                                      Text(listOfAddress[index].addressValue,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blackColor))
                                    ],
                                  );
                                },
                              ),
                            ),
                            showIcon: true,
                          ),
                          CardView(
                            cardTitle: "Other Details",
                            widget: OtherDetailsWidget(),
                            showIcon: true,
                          ),
                          CardView(
                            cardTitle: "Language & Preferences",
                            widget: Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Choosen Language ${Languages.of(context)!.stringLanguage}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  IconButton(
                                    color: Colors.red,
                                    icon: Icon(Icons.keyboard_arrow_right),
                                    onPressed: () {
                                      CustomModelBottomSheet._modelBottomSheet(
                                          context,
                                          widget: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Choose Language",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: Icon(Icons.close))
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  _createLanguageList()
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomElevatedButton(
                                                  buttonCta: "Add"),
                                            ],
                                          ));
                                    },
                                  )
                                ],
                              ),
                            ),
                            showIcon: false,
                          ),
                          Card.outlined(
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: AppColors.cardHeader,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Logout",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      color: Colors.red,
                                      icon: Icon(Icons.logout),
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text("Logout")));
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  _createLanguageList() {
    int? _selectedIndex;
    return Container(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: LanguageData.languageList().length,
          itemBuilder: (context, index) {
            return Obx(() => ListTile(
                  onTap: () {
                    changeLanguage(context,
                        LanguageData.languageList()[index].languageCode);
                    // _selectedIndex = controller.listIndex.value;
                    controller.onLanguageChange(index);
                    print("ListTile: $index");
                  },
                  trailing: controller.listIndex.value == index
                      ? Icon(
                          Icons.check_circle_outline,
                          color: Colors.deepOrangeAccent,
                        )
                      : Icon(Icons.check_circle_outline),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LanguageData.languageList()[index].name),
                        // IconButton(
                        //     onPressed: () {
                        //       changeLanguage(context,
                        //           LanguageData.languageList()[index].languageCode);
                        //       setState(() {
                        //         _selectedIndex = index;
                        //       });
                        //     },
                        //     icon: _selectedIndex == index ? Icon(
                        //       Icons.check_circle_outline,
                        //       color: Colors.deepOrangeAccent,
                        //     ): Icon(
                        //       Icons.check_circle_outline,
                        //       color: Colors.grey,
                        //     )
                        // )
                      ]),
                ));
          }),
    );
  }
}

Widget _buildKeyValuePair(String key, String value) {
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style:
          TextStyle(color: Colors.grey, fontSize: 15),
        ),
        Text(value,  style: TextStyle(
            color: Colors.black, fontSize: 15)),
      ],
    ),
  );
}

class CustomModelBottomSheet {
  static Future _modelBottomSheet(context, {required Widget widget}) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 20, left: 10, right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 5,
                    width: 80,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  widget
                ],
              ),
            ),
          );
        });
  }
}
