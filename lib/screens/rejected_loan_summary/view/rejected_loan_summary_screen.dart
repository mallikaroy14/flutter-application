import 'package:feburary_flutter/customUtility/custom_time_line.dart';
import 'package:feburary_flutter/screens/new_request/view/create_new_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/data.dart';
import '../../../theme/app_colors.dart';
import '../controller/rejected_loan_summary_controller.dart';

class RejectedLoanSummaryScreen extends GetView<RejectedLoanSummaryController> {
  const RejectedLoanSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List rejectedDetails = [
      RejectedLoanSummary("25,00,000", "Sagar", "Customer Application",
          "Ankit Joshi", "8764563765"),
      RejectedLoanSummary("26,00,000", "Mallika", "Customer Application",
          "Ankit Joshi", "8976788954"),
    ];

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
              child: SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    color: AppColors.whiteColor,
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: rejectedDetails.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                                                    topLeft:
                                                        Radius.circular(15.0),
                                                    topRight:
                                                        Radius.circular(15.0))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, bottom: 5, top: 5),
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Home Loan: 1234567",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "Status : Rejected",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      ],
                                                    ),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(Icons
                                                            .chevron_right))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Obx(() => expandedWidget(
                                              rejectedDetails, index, context))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
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

  Padding expandedWidget(rejectedDetails, index, context) {
    final _screen = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _screen.width * 0.43,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Applied Amount",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        rejectedDetails[index].appliedAmount,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.blackColor,
                            fontSize: 12),
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
                        "Borrowers Name",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        rejectedDetails[index].borrowersName,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.blackColor,
                            fontSize: 12),
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
                  width: _screen.width * 0.40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Source",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        rejectedDetails[index].source,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.blackColor,
                            fontSize: 12),
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
                        "RM name",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        rejectedDetails[index].rmName,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.blackColor,
                            fontSize: 12),
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
                  width: _screen.width * 0.40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Contact no.",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        rejectedDetails[index].contactNo,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.blackColor,
                            fontSize: 12),
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
                        "Home Loan: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grayColor,
                            fontSize: 12),
                      ),
                      Text(
                        "Sactioned ammount",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.blackColor,
                            fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(color: AppColors.lightGreyColor),
          InkWell(
            onTap: () {
              controller.isExpanded.value = !controller.isExpanded.value;
            },
            child:
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text("See All Updates",
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.normal)),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                width: 35,
                height: 40,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  onPressed: () {
                    controller.isExpanded.value = !controller.isExpanded.value;
                  },
                  icon: Icon(
                    controller.isExpanded.value
                        ? Icons.keyboard_arrow_down_sharp
                        : Icons.expand_less,
                    color: AppColors.primaryColor,
                  ),
                ),
              )
            ],
          ),
          ),
          if (controller.isExpanded.value) expandableWidgetSeeAllUpdates()
        ],
      ),
    );
  }

  Column expandableWidgetSeeAllUpdates() {
    return Column(
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
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13),
                          children: [
                            WidgetSpan(
                                child: SizedBox(
                              width: 5,
                            )),
                            WidgetSpan(
                                child: Text(
                              '12 aug 2024',
                              style: TextStyle(
                                  color: AppColors.grayColor, fontSize: 13),
                            ))
                          ])),
                    ))),
        const SizedBox(height: 10),
      ],
    );
  }
}
