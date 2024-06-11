import 'package:feburary_flutter/screens/loan_summary/controller/loan_summary_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class LoanSummaryScreen extends GetView<LoanSummaryController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.appBarColor,
        titleSpacing: 0,
        title: const Text(
          "Loan Summary",
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
        // controller: controller.expandController,
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
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
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 15),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, int) {
                        return SizedBox(
                          width: double.infinity,
                          child: Card.outlined(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Column(
                                children: [
                                  Obx( () =>
                                     ExpansionTile(
                                      // controller: controller.expandController,
                                      collapsedShape:
                                          const ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      shape: const ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      expandedCrossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      dense: true,
                                      childrenPadding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      tilePadding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      iconColor: Colors.black,
                                      backgroundColor: AppColors.whiteColor,
                                      collapsedIconColor: Colors.black,
                                      collapsedBackgroundColor:
                                          AppColors.lightBlueColor,
                                      title: const Text(
                                        "Home Loan: 123456",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.blackColor,
                                            fontSize: 13),
                                      ),
                                      subtitle: const Text(
                                        "Sanctioned amount : yr7823t",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.grayColor,
                                            fontSize: 12),
                                      ),
                                      onExpansionChanged: (bool expand) {
                                        controller.customTileExpanded.value = expand;
                                      },
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                if (controller.expandController.isExpanded) {
                                                  controller.expandController.collapse();
                                                } else {
                                                  controller.expandController.expand();
                                                }
                                              },
                                              icon: Icon(controller.customTileExpanded.isTrue
                                                  ? Icons.expand_more
                                                  : Icons.expand_less)),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.menu)),
                                        ],
                                      ),
                                      children: [expandedWidget()],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          )),
    );
  }

  Column expandedWidget() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  "LAN/application ID",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.grayColor,
                      fontSize: 13),
                ),
                Text(
                  "Sactioned ammount",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.blackColor,
                      fontSize: 12),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "Borrowers Name",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.grayColor,
                      fontSize: 13),
                ),
                Text(
                  "Mallika Roy",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.blackColor,
                      fontSize: 12),
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Loan Type",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.grayColor,
                        fontSize: 13),
                  ),
                  Text(
                    "Sactioned ammount ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                        fontSize: 12),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Current ROI",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.grayColor,
                        fontSize: 13),
                  ),
                  Text(
                    "Sactioned ammount",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                        fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Disbursed ammount",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.grayColor,
                        fontSize: 13),
                  ),
                  Text(
                    "Sactioned ammount ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                        fontSize: 12),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Loan amount sanctioned",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.grayColor,
                        fontSize: 13),
                  ),
                  Text(
                    "Sanctioned amount",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                        fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Home Loan: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.grayColor,
                        fontSize: 13),
                  ),
                  Text(
                    "Sanctioned amount ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                        fontSize: 12),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Home Loan: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.grayColor,
                        fontSize: 13),
                  ),
                  Text(
                    "Sanctioned amount",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                        fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Home Loan: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.grayColor,
                        fontSize: 13),
                  ),
                  Text(
                    "Sactioned ammount ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                        fontSize: 12),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Home Loan: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.grayColor,
                        fontSize: 13),
                  ),
                  Text(
                    "Sactioned ammount",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                        fontSize: 12),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
