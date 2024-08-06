import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

TextFormField customTextField(String fieldName, TextInputType keyboardKey,
    controller, errorMessage, isValueNotEmpty) {
  return TextFormField(
    inputFormatters: [
      FilteringTextInputFormatter.deny(RegExp(r'\s')),
    ],
    scribbleEnabled: true,
    controller: controller,
    decoration: InputDecoration(
      counterText: "",
      contentPadding:
          const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
      constraints: const BoxConstraints(minHeight: 35),
      label: RichText(
        text: TextSpan(
            text: fieldName,
            style: errorMessage.isEmpty
                ? AppTextStyle.textRegular17Grey
                : AppTextStyle.textError17Red),
      ),
      errorStyle: const TextStyle(color: AppColors.redColor),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.r)),
          borderSide: const BorderSide(color: AppColors.redColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.r)),
          borderSide: const BorderSide(color: AppColors.grayColor)),
      errorText: errorMessage.isEmpty ? null : errorMessage,
      labelStyle: errorMessage.isEmpty
          ? AppTextStyle.textError17Red
          : AppTextStyle.textRegular18Grey,
      errorBorder: isValueNotEmpty
          ? OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.r)),
              borderSide: const BorderSide(color: AppColors.grayColor))
          : OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.r)),
              borderSide: const BorderSide(color: AppColors.redColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.r)),
          borderSide: const BorderSide(color: AppColors.grayColor)),
      hintStyle: AppTextStyle.textRegular18Black,
    ),
    keyboardType: keyboardKey,
  );
}

TextFormField dateOfBirthTextField(
    BuildContext context, controller, errorMessage, isDobValid) {
  return TextFormField(
    scribbleEnabled: true,
    controller: controller.dobController,
    onTap: () async {
      DateTime? date = DateTime(1900);
      FocusScope.of(context).requestFocus(FocusNode());
      date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now());
      if (date != null) {
        String formattedDate = DateFormat("dd-MM-yyyy").format(date);
        getFormattedDate(date) {
          var inputFormat = DateFormat('dd-MM-yyyy');
          var inputDate = inputFormat.parse(date);
          var outputFormat = DateFormat('dd-MM-yyyy');
          return outputFormat.format(inputDate);
        }

        controller.dobController.text = getFormattedDate(formattedDate);
      }
    },
    decoration: InputDecoration(
      counterText: "",
      contentPadding:
          const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
      constraints: BoxConstraints(minHeight: 35.h),
      suffixIcon: const Icon(Icons.calendar_today),
      hintText: "DateOf Birth",
      label: RichText(
        text: TextSpan(
            text: "TranslationKeys.txtDateOfBirth.tr",
            style: AppTextStyle.textRegular17Grey),
      ),
      errorStyle: const TextStyle(color: AppColors.redColor),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.r)),
          borderSide: const BorderSide(color: AppColors.redColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.r)),
          borderSide: const BorderSide(color: AppColors.grayColor)),
      errorText: errorMessage.isEmpty ? null : errorMessage,
      labelStyle: errorMessage.isEmpty
          ? AppTextStyle.textError17Red
          : AppTextStyle.textRegular18Grey,
      errorBorder: isDobValid
          ? OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.r)),
              borderSide: const BorderSide(color: AppColors.grayColor))
          : OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.r)),
              borderSide: const BorderSide(color: AppColors.redColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.r)),
          borderSide: const BorderSide(color: Colors.grey)),
      hintStyle: AppTextStyle.textRegular18Black,
    ),
    keyboardType: TextInputType.datetime,
  );
}
