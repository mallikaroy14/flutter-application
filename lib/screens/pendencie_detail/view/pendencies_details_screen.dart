import 'package:feburary_flutter/screens/pendencie_detail/controller/pendencies_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/data.dart';
import '../../../theme/app_colors.dart';
import '../../new_request/view/create_new_request.dart';

class PendenciesDetailsScreen extends GetView<PendenciesDetailsController> {
  const PendenciesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PendenciesCardData pendensiesData = ModalRoute.of(context)?.settings.arguments as PendenciesCardData;

    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: appBarWidget( "Application :${pendensiesData.applicationID} "),
      body: Column(
        children: [
          const SizedBox(
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
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  children: [
                    buildListView(pendensiesData, context),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        scribbleEnabled: true,
                        maxLines: 3,
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 7.0, horizontal: 10.0),
                          label: RichText(
                            text: const TextSpan(
                                text: "Remark",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal)),
                          ),
                          errorStyle:
                              const TextStyle(color: AppColors.redColor),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.redColor)),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          hintStyle: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 45,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildListView(pendensiesData, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Card.outlined(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: expandedWidget(pendensiesData, context),
          ),
        ),
      ),
    );
  }

  Container expandedWidget(pendensiesData, context) {
    final screen = MediaQuery
        .of(context)
        .size;
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.cardHeader,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Document name/task",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                        "${pendensiesData.documentName}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                            fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screen.width * 0.40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Category",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppColors.grayColor,
                              fontSize: 13),
                        ),
                        Text(
                          "${pendensiesData.category}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: screen.width * 0.40,
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
                            "${pendensiesData.subCategory}" != "" ? "${pendensiesData.subCategory}": "- -",
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remarks",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor,
                            fontSize: 13),
                      ),
                      Text(
                       "${pendensiesData.remark}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                            fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
