import 'package:feburary_flutter/screens/new_request/view/create_new_request.dart';
import 'package:feburary_flutter/screens/pendencies/controller/pendencies_controller.dart';
import 'package:feburary_flutter/utility/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../models/data.dart';
import '../../../theme/app_colors.dart';

class PendenciesScreen extends GetView<PendenciesController> {
  final List pendencies = [
    PendenciesCardData("1234543234", "Lorem ipsum", "Technical", "",
        "Agreement copy is missing"),
    PendenciesCardData("1234543235", "Lorem ipsum", "Technical", "OTC",
        "Agreement copy is missing")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: appBarWidget(context, "Pendencies"),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grayColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: const Offset(0, 1))
                  ],
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    color: AppColors.whiteColor,
                    child: Column(
                      children: [
                        buildListView(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
        itemCount: pendencies.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              width: double.infinity,
              child: Card.outlined(
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
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15, bottom: 10, top: 10, right: 15),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pendencies[index].applicationID,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "Application ID",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(RouteName.pendenciesDetails, arguments: pendencies[index]);
                                  },
                                  child: Text("Respond",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: AppColors.primaryColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      expandedWidget(pendencies, index, context)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Padding expandedWidget(pendencies, index, context) {
    final _screen = MediaQuery
        .of(context)
        .size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Document name/task",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        pendencies[index].documentName,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                            fontSize: 13),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _screen.width * 0.40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        pendencies[index].category,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                            fontSize: 13),
                      )
                    ],
                  ),
                ),
                Container(
                  width: _screen.width * 0.40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sub-category",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        pendencies[index].subCategory != ''
                            ? pendencies[index].subCategory
                            : "- -",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                            fontSize: 13),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Remarks",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        pendencies[index].remark,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                            fontSize: 13),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
