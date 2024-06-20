import 'package:feburary_flutter/screens/new_request/view/create_new_request.dart';
import 'package:feburary_flutter/screens/rejected_loan_summary/controller/rejected_loan_summary_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class RejectedLoanSummaryScreen extends GetView<RejectedLoanSummaryController> {
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  color: AppColors.whiteColor,
                  child: ListView.builder(
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
                                                if (controller.expandController
                                                    .isExpanded) {
                                                  controller.expandController
                                                      .collapse();
                                                } else {
                                                  controller.expandController
                                                      .expand();
                                                }
                                              },
                                              icon: Icon(controller
                                                      .customTileExpanded.isTrue
                                                  ? Icons.expand_more
                                                  : Icons.expand_less)),
                                        ],
                                      ),
                                      children: [
                                        expandedWidget()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
            ),
          ),
        ],
      ),
    );
  }

  Column expandedWidget() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
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
        Padding(
          padding: EdgeInsets.all(8.0),
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
        Padding(
          padding: EdgeInsets.all(8.0),
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
        )
      ],
    );
  }
}
