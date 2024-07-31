import 'dart:async';
import 'dart:io';

import 'package:feburary_flutter/screens/new_request/controller/create_new_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../theme/app_colors.dart';

class CreateNewRequest extends GetView<CreateNewRequestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: appBarWidget("Create New Request"),
      body: Container(
        color: AppColors.appBarColor,
        child: Column(
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
                                Text(
                                  "Select Options",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(() => DropdownMenu<String>(
                                      // errorText: controller
                                      //     .employmentError.value.isNotEmpty
                                      //     ? controller.employmentError.value
                                      //     : null,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                      controller: controller.serviceRequestType,
                                      menuStyle: const MenuStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  AppColors.whiteColor)),
                                      expandedInsets: EdgeInsets.zero,
                                      selectedTrailingIcon: const Icon(
                                        Icons.keyboard_arrow_up,
                                        color: AppColors.primaryColor,
                                      ),
                                      trailingIcon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.primaryColor,
                                      ),
                                      label: Text("Type of service Request"),
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
                                      inputDecorationTheme:
                                          const InputDecorationTheme(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        constraints: BoxConstraints(
                                            minHeight: 50, maxHeight: 50),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppColors.grayColor)),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(() => DropdownMenu<String>(
                                      // errorText: controller
                                      //     .employmentError.value.isNotEmpty
                                      //     ? controller.employmentError.value
                                      //     : null,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                      controller: controller.loanAccount,
                                      menuStyle: const MenuStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  AppColors.whiteColor)),
                                      expandedInsets: EdgeInsets.zero,
                                      selectedTrailingIcon: const Icon(
                                        Icons.keyboard_arrow_up,
                                        color: AppColors.primaryColor,
                                      ),
                                      trailingIcon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.primaryColor,
                                      ),
                                      label: Text("Loan Account"),
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
                                      inputDecorationTheme:
                                          const InputDecorationTheme(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        constraints: BoxConstraints(
                                            minHeight: 50, maxHeight: 50),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppColors.grayColor)),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  scribbleEnabled: true,
                                  controller: controller.name,
                                  validator: (value) {},
                                  decoration: InputDecoration(
                                    counterText: "",
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 7.0, horizontal: 10.0),
                                    label: RichText(
                                      text: const TextSpan(
                                          text: "Name",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                    errorStyle:
                                        TextStyle(color: AppColors.redColor),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.redColor)),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    // labelStyle:
                                    // controller.mobileError.value.isEmpty
                                    //     ? TextStyle(
                                    //     fontSize: 18,
                                    //     color: AppColors.redColor)
                                    //     : TextStyle(
                                    //     fontSize: 18,
                                    //     color: AppColors.grayColor),
                                    // errorText:
                                    // controller.mobileError.value.isEmpty
                                    //     ? null
                                    //     : controller.mobileError.value,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    hintStyle: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  keyboardType: TextInputType.name,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  scribbleEnabled: true,
                                  controller: controller.mobileNumber,
                                  validator: (value) {},
                                  decoration: InputDecoration(
                                    counterText: "",
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 7.0, horizontal: 10.0),
                                    label: RichText(
                                      text: const TextSpan(
                                          text: "Mobile Number",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                    errorStyle:
                                        TextStyle(color: AppColors.redColor),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.redColor)),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    // labelStyle:
                                    // controller.mobileError.value.isEmpty
                                    //     ? TextStyle(
                                    //     fontSize: 18,
                                    //     color: AppColors.redColor)
                                    //     : TextStyle(
                                    //     fontSize: 18,
                                    //     color: AppColors.grayColor),
                                    // errorText:
                                    // controller.mobileError.value.isEmpty
                                    //     ? null
                                    //     : controller.mobileError.value,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    hintStyle: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  keyboardType: TextInputType.phone,
                                ),
                                // Obx(() => customTextField(
                                //     "Email ID",
                                //     TextInputType.emailAddress,
                                //     controller.emailController,
                                //     controller.emailError.value,
                                //     controller.isEmailValid.isTrue
                                //         ? true
                                //         : false)),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  scribbleEnabled: true,
                                  maxLength: 11,
                                  controller: controller.emailID,
                                  validator: (value) {},
                                  decoration: InputDecoration(
                                    counterText: "",
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 7.0, horizontal: 10.0),
                                    label: RichText(
                                      text: const TextSpan(
                                          text: "Email ID",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                    errorStyle:
                                        TextStyle(color: AppColors.redColor),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.redColor)),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    hintStyle: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  scribbleEnabled: true,
                                  maxLines: 3,
                                  controller: controller.remark,
                                  validator: (value) {},
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
                                        TextStyle(color: AppColors.redColor),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.redColor)),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    labelStyle: true
                                        ? TextStyle(
                                            fontSize: 18,
                                            color: AppColors.redColor)
                                        : TextStyle(
                                            fontSize: 18,
                                            color: AppColors.grayColor),
                                    //  errorText:
                                    // true
                                    // ? null
                                    // : controller.mobileError.value,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    hintStyle: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: RichText(
                                      text: TextSpan(children: [
                                        const WidgetSpan(
                                            child: Icon(
                                          size: 18,
                                          Icons.attach_file_sharp,
                                          color: AppColors.primaryColor,
                                        )),
                                        TextSpan(
                                          text: "Attach File",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.primaryColor),
                                        )
                                      ]),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                submitButton()
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

  late File _image;

  Future<File?> getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final directory = await getExternalStorageDirectory();
    if (pickedFile != null && directory != null) {
      return _image = await File(pickedFile.path)
          .copy('${pickedFile.path}/${directory.path}');
    } else {
      return null;
    }
  }

  Container submitButton() {
    return Container(
      margin: EdgeInsets.all(5),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          customSnackBar(
              "Request submitted successfully and ticket ID is 123423.",
              Icons.check_circle);
        },
        child: const Text("Submit",
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}

void customSnackBar(message, icon) {
  Get.rawSnackbar(
      message: message,
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20),
      overlayColor: AppColors.blackColor.withAlpha(170),
      icon: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Icon(icon, color: AppColors.whiteColor),
      ),
      backgroundColor: AppColors.greenColor,
      overlayBlur: 0.1,
      borderRadius: 8,
      duration: 5.seconds);
}

AppBar appBarWidget(title) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.appBarColor,
    titleSpacing: 0,
    title: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.chevron_left)),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.phone))],
  );
}
