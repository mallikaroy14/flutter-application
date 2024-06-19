import 'package:feburary_flutter/screens/refer_a_friend/controller/refer_a_friend_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../customUtility/custom_time_line.dart';
import '../../../theme/app_colors.dart';
import '../../expandableWidget.dart';

class RequestsScreen extends GetView<ReferAFriendController> {
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
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  color: AppColors.whiteColor,
                  child: LayoutBuilder(builder: (context, constraint) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card.outlined(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              // if you need this
                              side: BorderSide(
                                color:
                                AppColors.grayColor.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            elevation: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
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
                                    backgroundColor: AppColors.lightBlueColor,
                                    shape: const ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    expandedCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    dense: true,
                                    tilePadding: const EdgeInsets.symmetric(
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
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: const Text("Create New Request",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500)),
                            ),
                          )
                        ]);
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

  LayoutBuilder expandedWidget() {
    return LayoutBuilder(builder: (context, constraint) {
      double _height = constraint.maxHeight;

      return IntrinsicHeight(
        child: Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: AppColors.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalLineWithIcon(_height),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      querySent(),
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
                      SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Padding querySent() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 5),
      child: Column(
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
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double dashWidth;
  final double dashGap;

  _DashedLinePainter({
    required this.color,
    required this.thickness,
    required this.dashWidth,
    required this.dashGap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.square;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

Column verticalLineWithIcon(_height) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
          height: 15, child: VerticalDivider(color: AppColors.orangeColor)),
      Icon(
        Icons.notifications, // Replace with your desired icon
        size: 20.0,
        color: AppColors.orangeColor,
      ), // Space between icon and line

      // Vertical line with dashed effect
      Container(
        height: 180,
        child: CustomPaint(
          painter: _DashedLinePainter(
            color: AppColors.orangeColor,
            thickness: 1,
            dashWidth: 2,
            dashGap: 2,
          ),
        ),
      ),
    ],
  );
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final double dashWidth = 5.0;
    final double dashSpace = 5.0;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

// class DashedLineVerticalPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     double dashHeight = 10,
//         dashSpace = 3,
//         startY = 0;
//     final paint = Paint()
//       ..color = AppColors.orangeColor
//       ..strokeWidth = size.width;
//     while (startY < size.height) {
//       canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
//       startY += dashHeight + dashSpace;
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
}
