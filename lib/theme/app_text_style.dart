import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static final textHeader18Black = TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500);

  static final textHeader16Black = TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500);

  static final textHeader14Black = TextStyle(
  color: AppColors.blackColor,
  fontWeight: FontWeight.w500,
  fontSize: 14.sp);

  static final textBold20Black = TextStyle(
    color: AppColors.blackColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static final textRegular14Grey =
      TextStyle(fontSize: 14.sp, color: AppColors.darkGreyColor);

  static final textRegular14Red = TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: AppColors.orangeColor,
      color: AppColors.orangeColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.normal);

  static final textRegular17White = TextStyle(
      color: AppColors.whiteColor,
      fontSize: 17.sp,
      fontWeight: FontWeight.w500);

  static final textRegular16Grey = TextStyle(
      color: AppColors.grayColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.normal);

  static final textRegular17Grey = TextStyle(
      color: AppColors.darkGreyColor,
      fontSize: 17.sp,
      fontWeight: FontWeight.normal);

  static final textRegular16Black = TextStyle(
      color: AppColors.blackColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.normal);

  static final textRegular16White = TextStyle(
      color: AppColors.whiteColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.normal);

  static final textRegular18Black = TextStyle(
      fontSize: 18.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.normal);

  static final textRegular18Grey = TextStyle(
      fontSize: 18.sp,
      color: AppColors.darkGreyColor,
      fontWeight: FontWeight.normal);

  static final textError17Red =
      TextStyle(fontSize: 17.sp, color: AppColors.redColor);

  static final textBold15Primary = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold);

  static const textErrorRed = TextStyle(color: AppColors.redColor);

  static final textErrorRed13 =
      TextStyle(color: AppColors.redColor, fontSize: 13.sp);

  static const textRegularGrey =
      TextStyle(color: AppColors.grayColor, fontWeight: FontWeight.normal);

  static final textRegularDarkGrey =
      TextStyle(color: AppColors.darkGreyColor, fontSize: 13.sp);
  static final textBold16White = TextStyle(
      color: AppColors.whiteColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold);
  static final textBold16OrangeWithUnderLine = TextStyle(
    decorationColor: Colors.orange,
    decoration: TextDecoration.underline,
    fontSize: 16.sp,
    color: Colors.orange,
    fontWeight: FontWeight.bold,
  );
  static final textRegular16DarkGrey = TextStyle(
      color: AppColors.darkGreyColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.normal);

  static final textBoldWhite17 = TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.sp);

  static final textGrey12 = TextStyle(
      color: AppColors.grayColor, fontWeight: FontWeight.w500, fontSize: 12.sp);

  static final textRegularWhite15 = TextStyle(
      color: AppColors.whiteColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500);

  static final textRegularBlack15 = TextStyle(
      fontSize: 15.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.normal);

  static final textSemiBoldBlack17 = TextStyle(
      fontSize: 15.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500);

  static final textBoldBlack15 = TextStyle(
      fontSize: 15.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600);

  static final textBlack15 = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 15.0.sp, color: AppColors.blackColor);

  static final textPrimarySemiBold18 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0.sp,
      color: AppColors.primaryColor);

  static final textWhiteBold16 = TextStyle(
  color: AppColors.whiteColor,
  fontSize: 16.sp,
  fontWeight: FontWeight.bold);

  // static final text = TextStyle(
  //     color: AppColors.whiteColor,
  //     fontSize: 17.sp,
  //     fontWeight: FontWeight.w500)
}
