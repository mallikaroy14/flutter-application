import 'package:feburary_flutter/customUtility/custom_time_line.dart';
import 'package:feburary_flutter/screens/new_request/view/create_new_request.dart';
import 'package:feburary_flutter/screens/rejected_loan_summary/controller/rejected_loan_summary_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class RejectedLoanSummaryScreen extends GetView<RejectedLoanSummaryController> {
  const RejectedLoanSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: appBarWidget(context, "Rejected Loan Summary"),
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
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: AppColors.whiteColor,
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: double.infinity,
                            child: Card.outlined(
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Column(
                                  children: [
                                    Obx(
                                      () => ExpansionTile(
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
                                        childrenPadding:
                                            const EdgeInsets.symmetric(
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
                                          controller.customTileExpanded.value =
                                              expand;
                                        },
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  if (controller
                                                      .expandController
                                                      .isExpanded) {
                                                    controller.expandController
                                                        .collapse();
                                                  } else {
                                                    controller.expandController
                                                        .expand();
                                                  }
                                                },
                                                icon: Icon(controller
                                                        .customTileExpanded
                                                        .isTrue
                                                    ? Icons.expand_more
                                                    : Icons.expand_less)),
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
                    Card.outlined(
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
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 0, right: 20, top: 10),
                                child: SizedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Home Loan: 1234567",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Status : Rejected",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.chevron_right))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            expandedWidget()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding expandedWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          const Divider(),
          Row(
            children: [
              const Text("See All Updates",
                  style: TextStyle(
                      fontSize: 13,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.normal)),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          Column(
            children: [
              Timeline(
                  padding: EdgeInsets.zero,
                  lineGap: 0,
                  lineColor: AppColors.orangeDarkColor,
                  indicators: List<Widget>.generate(
                      3,
                      (index) => const Icon(
                            Icons.check_circle,
                            color: AppColors.orangeDarkColor,
                            size: 20,
                          )),
                  children: List<Widget>.generate(
                      3,
                      (index) => Container(
                            child: const Text.rich(TextSpan(
                                text: 'In-progress',
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                                children: [
                                  WidgetSpan(
                                      child: SizedBox(
                                    width: 5,
                                  )),
                                  WidgetSpan(
                                      child: Text(
                                    '12 aug 2024',
                                    style: TextStyle(color: AppColors.grayColor, fontSize: 13),
                                  ))
                                ])),
                          ))),
              const SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}
