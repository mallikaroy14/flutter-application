import 'package:feburary_flutter/screens/pay_EMI/controller/pay_emi_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class PayEmiScreen extends StatefulWidget {
  const PayEmiScreen({Key? key}) : super(key: key);

  @override
  State<PayEmiScreen> createState() => _PayEmiScreen();
}

class _PayEmiScreen extends State<PayEmiScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        titleSpacing: 0,
        title: const Text(
          "Pay EMI",
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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight,
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
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
                child: Column(
                  children: [
                    TabBar(controller: tabController, tabs: [
                      Tab(text: "Overdue EMI's"),
                      Tab(text: "Upcoming EMI's"),
                      Tab(text: "Charges")
                    ]),

                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: TabBarView(
                            controller: tabController,
                            dragStartBehavior: DragStartBehavior.start,
                            physics: ScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            children: [
                              Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Colors.indigo.shade500,
                                      ),
                                      Text(
                                        'Woooops!!!',
                                        style: TextStyle(fontSize: 32),
                                      ),
                                      Text(
                                        'No Data found, please select loan account first',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: AppColors.grayColor),
                                      )
                                    ],
                                  )),
                              Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.radar_sharp,
                                        color: Colors.indigo.shade500,
                                      ),
                                      Text(
                                        'Woooops!!!',
                                        style: TextStyle(fontSize: 32),
                                      ),
                                      Text(
                                        'No Data found, please select loan account first',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: AppColors.grayColor),
                                      )
                                    ],
                                  )),
                              Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.indigo.shade500,
                                  ),
                                  Text(
                                    'Woooops!!!',
                                    style: TextStyle(fontSize: 32),
                                  ),
                                  Text(
                                    'No Data found, please select loan account first',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.grayColor),
                                  )
                                ],
                              )),
                            ]),
                      ),
                    )

                    // TabBarView(children: tabController.myTabs.map((Tab tab) => {
                    //     // final String label = tab.text!;
                    //
                    // }).toList();
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
