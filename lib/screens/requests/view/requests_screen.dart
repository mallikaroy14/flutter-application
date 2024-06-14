import 'package:feburary_flutter/screens/refer_a_friend/controller/refer_a_friend_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class RequestsScreen extends GetView<ReferAFriendController> {
  List<Step> step = [Step(title: Text(""), content: Text("Query Sent"), isActive: true)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: appBarWidget(context),
      body: Container(
        color: AppColors.appBarColor,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
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
                  child: LayoutBuilder(builder: (context, constraint) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: constraint.maxWidth,
                            minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card.outlined(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Column(
                                      children: [
                                        ExpansionTile(
                                          // controller: controller.expandController,
                                          collapsedShape:
                                              const ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          ),
                                          backgroundColor:
                                              AppColors.lightBlueColor,
                                          shape:
                                              const ContinuousRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30))),
                                          expandedCrossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          dense: true,
                                          tilePadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 15),
                                          iconColor: Colors.black,
                                          collapsedIconColor: Colors.black,
                                          collapsedBackgroundColor:
                                              AppColors.lightBlueColor,
                                          title: cardHeaderWidget(),
                                          onExpansionChanged: (bool expand) {
                                            // controller.customTileExpanded.value = expand;
                                          },
                                          trailing: SizedBox(),
                                          children: [expandedWidget()],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: const Text("Create New Request",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row cardHeaderWidget() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LAN ID",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.grayColor,
                  fontSize: 12),
            ),
            Text("2345678"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amount Paid",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.grayColor,
                        fontSize: 12)),
                Text("590"),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Service Request Type",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColors.grayColor,
                    fontSize: 12),
              ),
              Text(
                "Statement of Account",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColors.blackColor,
                    fontSize: 12),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Requested Date and Time",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.grayColor,
                        fontSize: 12),
                  ),
                  Text(
                    "12 Aug 2023,02:42PM ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                        fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      titleSpacing: 0,
      title: const Text(
        "Service Requests",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left)),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.phone))],
    );
  }

  Container expandedWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: AppColors.whiteColor,
      child:
      // Stepper(steps: step, type: StepperType.vertical,)


      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Query Sent",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.orangeColor),
          ),
          Text(
            "Ticket ID 123456- assigned to service agent",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColors.grayColor),
          ),
          Text(
            "ABC.pdf",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryColor),
          ),
          SizedBox(height: 5),
          const Text(
            "Remark",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: AppColors.grayColor),
          ),
          TextFormField(
              decoration: const InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grayColor)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grayColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grayColor)),
          )),
          SizedBox(height: 10),
          Container(
              height: 40,
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    disabledBackgroundColor: AppColors.grayColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: const Text("Submit",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal)),
              )),
        ],
      ),
    );
  }
}
