import 'package:feburary_flutter/screens/self_service/controller/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class SelfServiceScreen extends GetView<SelfServiceController> {
  const SelfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi, Priya!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              Text("Last login at 23-01-2024",
                  style: TextStyle(
                      color: AppColors.grayColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12))
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                  onTap: () {},
                  child: const Icon(Icons.phone, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: const Icon(Icons.language, color: Colors.white),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: const Icon(Icons.notifications_none_sharp,
                    color: Colors.white),
                onTap: () {},
              ),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.homeBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: listOfDocument.length,
                      itemBuilder: (context, index) {
                        return Card.outlined(
                          color: AppColors.whiteColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Column(
                                children: [
                                  ListTile(
                                    shape: const ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    onTap: () {
                                      downloadLoanBottomSheet(
                                          listOfDocument[index].text,
                                          "Select loan account to download the pdf.");
                                    },
                                    title: Text(listOfDocument[index].text),
                                    leading: Icon(listOfDocument[index].icon),
                                    dense: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }

  Future downloadLoanBottomSheet(title, subtitle) {
    return Get.bottomSheet(
        backgroundColor: AppColors.whiteColor,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 80,
                decoration: const BoxDecoration(
                    color: AppColors.grayColor,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () => {Get.back()}, icon: Icon(Icons.close))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subtitle,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => DropdownMenu<String>(
                        trailingIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.primaryColor,
                        ),
                        menuStyle: const MenuStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(AppColors.whiteColor)),
                        expandedInsets: EdgeInsets.zero,
                        selectedTrailingIcon: const Icon(
                          Icons.keyboard_arrow_up,
                          color: AppColors.primaryColor,
                        ),
                        dropdownMenuEntries: controller.list
                            .asMap()
                            .entries
                            .map(
                              (item) => DropdownMenuEntry<String>(
                                value: item.value,
                                label: item.value,
                              ),
                            )
                            .toList(),
                        inputDecorationTheme: const InputDecorationTheme(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          constraints: BoxConstraints(
                            minHeight: 50,
                            maxHeight: 50,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: AppColors.grayColor)),
                        ),
                        label: Text("Select Loan account"),
                      ),
                    ),
                    SizedBox(height: 10),
                    downloadPdfButton()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  ElevatedButton downloadPdfButton() {
    return ElevatedButton(
      // statesController: controller.pinStateController,
      style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
              // controller.isPinValid.value
              true ? AppColors.primaryColor : AppColors.grayColor),
          minimumSize: WidgetStatePropertyAll(Size(Get.width, 50))),
      onPressed: () {},
      child: Text("Download pdf",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500)),
    );
  }

  Card cardsWidget(title, icon) {
    return Card.outlined(
      color: AppColors.whiteColor,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ExpansionTile(
          collapsedShape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          title: Text(title),
          leading: Icon(icon),
          dense: true,
        ),
      ),
    );
  }
}

List listOfDocument = [
  DataDocument("Interest Certificate", Icons.document_scanner_outlined),
  DataDocument("Download loan Agreement", Icons.download_outlined),
  DataDocument("Download insurance Policy", Icons.edit_calendar),
  DataDocument("Download welcome letter", Icons.co_present),
  DataDocument("Repayment schedule", Icons.co_present)
];

class DataDocument {
  String text;
  IconData icon;

  DataDocument(this.text, this.icon);
}
