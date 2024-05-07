import 'dart:math';

import 'package:feburary_flutter/localization/language/languages.dart';
import 'package:flutter/material.dart';

import '../customUtility/CustomWidget.dart';
import '../localization/locale_constant.dart';
import '../localization/languageData.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromRGBO(254, 252, 230, 100)),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardView(
                          cardTile: "Personal Details",
                          widget: Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  Text(
                                    Languages.of(context)!.stringUserName,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Gender",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date Of Birth",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  Text(
                                    "13-08-1996",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Mobile Number",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  Text(
                                    "82345-12345",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Email ID",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  Text(
                                    "mallika.roy@bajajfinserv.in",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                        const CardView(
                            cardTile: "Address Details",
                            widget: Text("Personal Detailssss")),
                        CardView(
                            cardTile: "Other Details",
                            widget:
                                // Text("Personal Detailssss")),
                                OtherDetailsWidget()),
                        CardView(
                            cardTile: "Language & Preferences",
                            widget: Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Choosen Language English",
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
                                                  Text(
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
                                              SizedBox(
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
                            )),
                        Card.outlined(
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(243, 247, 254, 100),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
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
            )
          ],
        ),
      ),
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
            return ListTile(
              onTap: () {
                changeLanguage(
                    context, LanguageData.languageList()[index].languageCode);

                setState(() {
                  _selectedIndex = index;
                });
              },
              trailing: _selectedIndex == index
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
              // onTap:
              //     (LanguageData? language) {
              //   changeLanguage(context, language?.languageCode ?? "");
              // },
            );
          }),
    );
  }
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
