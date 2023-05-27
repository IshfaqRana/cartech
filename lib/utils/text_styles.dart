import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyles {
  static TextStyle regBlack9 = TextStyle(
      color: AppColors.kBlack2,
      fontSize: 9.sp,
      fontFamily: AppFont.poppinsRegular);
  static TextStyle regBlack8 = TextStyle(
      color: AppColors.kBlack2,
      fontSize: 8.sp,
      fontFamily: AppFont.poppinsRegular);

  static TextStyle regBlack10 = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regBlack10Bold = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 10.sp,
    fontFamily: AppFont.poppinsBold,
  );
  static TextStyle regBlack14Bold = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 11.sp,
    fontFamily: AppFont.poppinsBold,
  );

  static TextStyle regBlack11 = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 13.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regBlack12 = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 12.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regBlackTextField12 = TextStyle(
    color: AppColors.kText,
    fontSize: 12.sp,
    fontFamily: AppFont.sFDisplayRegular,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle regBlackTextField10 = TextStyle(
    color: AppColors.kText,
    fontSize: 10.sp,
    fontFamily: AppFont.sFDisplayRegular,
  );
  static TextStyle regGreen9 = TextStyle(
      color: AppColors.kAppBGColor,
      fontSize: 9.sp,
      fontFamily: AppFont.poppinsRegular);
  static TextStyle regGreen8 = TextStyle(
      color: AppColors.kAppBGColor,
      fontSize: 8.sp,
      fontFamily: AppFont.poppinsRegular);

  static TextStyle regGreen10 = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regGreen10Bold = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 10.sp,
    fontFamily: AppFont.poppinsBold,
  );
  static TextStyle regGreen11Bold = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 11.sp,
    fontFamily: AppFont.poppinsBold,
  );

  static TextStyle regGreen11 = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 11.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regGreen12 = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 12.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regGreenTextField12 = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 12.sp,
    fontFamily: AppFont.poppinsBold,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle regGreenTextField10 = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 10.sp,
    fontFamily: AppFont.poppinsBold,
  );
  static TextStyle lightBlue14 = TextStyle(
      color: AppColors.lightBlue,
      fontSize: 14.sp,
      fontFamily: AppFont.poppinsBold,
      fontWeight: FontWeight.w500);
  static TextStyle lightBlue12 = TextStyle(
      color: AppColors.lightBlue,
      fontSize: 12.sp,
      fontFamily: AppFont.poppinsBold,
      fontWeight: FontWeight.w300);
  static TextStyle lightBlue10 = TextStyle(
      color: AppColors.lightBlue,
      fontSize: 10.sp,
      fontFamily: AppFont.poppinsBold,
      fontWeight: FontWeight.w300);
  static TextStyle lightBlue9 = TextStyle(
      color: AppColors.lightBlue,
      fontSize: 9.sp,
      fontFamily: AppFont.poppinsBold,
      fontWeight: FontWeight.w300);
  static TextStyle regBlack12Bold = TextStyle(
    color: AppColors.kBlack,
    fontSize: 12.sp,
    fontFamily: AppFont.poppinsBold,
  );
  static TextStyle regBlack10BoldTextField = TextStyle(
    color: AppColors.kBlack2.withOpacity(0.8),
    fontSize: 10.sp,
    fontFamily: AppFont.poppinsBold,
  );
  static TextStyle regBlack12Medium = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 12.sp,
    fontFamily: AppFont.poppinsMedium,
  );

  static TextStyle regBlack10Medium = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 10.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regBlack10W300 = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regBlack12W300 = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 10.5.sp,
    fontWeight: FontWeight.w300,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regBlack14Regular = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 11.sp,
    fontFamily: AppFont.sFDisplayRegular,
  );
  static TextStyle regBlue10W300 = TextStyle(
    color: AppColors.lightBlue,
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regBlue14Regular = TextStyle(
    color: AppColors.lightBlue,
    fontSize: 11.sp,
    //fontWeight: FontWeight.w300,
    fontFamily: AppFont.sFDisplayRegular,
  );
  static TextStyle regBlack15Medium = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 15.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regBlack15Bold = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 15.sp,
    fontFamily: AppFont.poppinsBold,
    fontWeight: FontWeight.w700,
  );
  static TextStyle regBlack20Medium = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 20.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regBlack25Medium = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 25.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regGreen15Medium = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 15.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regGreen15Bold = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 15.sp,
    fontFamily: AppFont.poppinsBold,
    // fontWeight: FontWeight.w700,
  );
  static TextStyle regGreen20Medium = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 20.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regGreen25Medium = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 25.sp,
    fontFamily: AppFont.poppinsMedium,
  );

  static TextStyle regBlack13 = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 13.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regBlack14 = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 14.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regBlack15 = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 15.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regBlack16 = TextStyle(
    color: AppColors.kBlack2,
    fontSize: 20.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regGreen13 = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 13.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regGreen14 = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 14.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regGreen15 = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 15.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regGreen16 = TextStyle(
    color: AppColors.kAppBGColor,
    fontSize: 20.sp,
    fontFamily: AppFont.poppinsRegular,
  );

/* -------------------------------------------------------------------------- */
/*                                    White                                   */
/* -------------------------------------------------------------------------- */

  static TextStyle regWhite8 = TextStyle(
      color: AppColors.kWhite,
      fontSize: 8.sp,
      fontFamily: AppFont.poppinsRegular);
  static TextStyle regWhite9 = TextStyle(
      color: AppColors.kWhite,
      fontSize: 9.sp,
      fontFamily: AppFont.poppinsRegular);
  static TextStyle regWhite10 = TextStyle(
      color: AppColors.kWhite,
      fontSize: 10.sp,
      fontFamily: AppFont.poppinsRegular);
  static TextStyle regWhite10Bold = TextStyle(
      color: AppColors.kWhite,
      fontSize: 10.sp,
      fontFamily: AppFont.poppinsMedium);

  static TextStyle regWhite11 = TextStyle(
      color: AppColors.kWhite,
      fontSize: 11.sp,
      fontFamily: AppFont.poppinsRegular);
  static TextStyle regWhite12 = TextStyle(
      color: AppColors.kWhite,
      fontSize: 12.sp,
      fontFamily: AppFont.poppinsRegular);

  static TextStyle regWhiteBold12 = TextStyle(
      color: AppColors.kWhite,
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      fontFamily: AppFont.poppinsBold);
  static TextStyle regWhite13 = TextStyle(
      color: AppColors.kWhite,
      fontSize: 13.sp,
      fontFamily: AppFont.poppinsRegular);
  static TextStyle regWhite14 = TextStyle(
      color: AppColors.kWhite,
      fontSize: 14.sp,
      fontFamily: AppFont.poppinsRegular);
  static TextStyle regWhite15 = TextStyle(
      color: AppColors.kWhite,
      fontWeight: FontWeight.bold,
      fontSize: 15.sp,
      fontFamily: AppFont.poppinsRegular);

  static TextStyle regWhite20 = TextStyle(
      color: AppColors.kWhite,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      fontFamily: AppFont.poppinsRegular);

  static TextStyle regWhite16 = TextStyle(
      color: AppColors.kWhite,
      fontSize: 30.sp,
      fontFamily: AppFont.poppinsMedium);
  static TextStyle regBlack30 = TextStyle(
      color: AppColors.kBlack,
      fontSize: 30.sp,
      fontFamily: AppFont.poppinsMedium);
  /* -------------------------------------------------------------------------- */
/*                                    White                                   */
/* -------------------------------------------------------------------------- */

  static TextStyle regBlue12 = TextStyle(
      color: AppColors.lightBlue,
      fontSize: 12.sp,
      fontFamily: AppFont.poppinsRegular);
  static TextStyle regBlueBold10 = TextStyle(
      color: AppColors.lightBlue,
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
      fontFamily: AppFont.poppinsBold);
//Grey Color TextStyles
  static TextStyle regGrey10 = TextStyle(
    color: AppColors.kGrey,
    fontSize: 10.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regGrey9 = TextStyle(
    color: AppColors.kGrey,
    fontSize: 9.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regGrey10Bold = TextStyle(
    color: AppColors.kGrey,
    fontSize: 10.sp,
    fontFamily: AppFont.poppinsBold,
  );
  static TextStyle regGrey10Medium = TextStyle(
    color: AppColors.kGrey,
    fontSize: 10.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regGrey8 = TextStyle(
    color: AppColors.kGrey,
    fontSize: 8.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regGrey8Medium = TextStyle(
    color: AppColors.kGrey,
    fontSize: 8.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regGrey8Bold = TextStyle(
    color: AppColors.kGrey,
    fontSize: 8.sp,
    fontFamily: AppFont.poppinsBold,
  );
  static TextStyle regGrey12 = TextStyle(
    color: AppColors.kGrey,
    fontSize: 12.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regGrey12Medium = TextStyle(
    color: AppColors.kGrey,
    fontSize: 12.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regGrey15Medium = TextStyle(
    color: AppColors.kGrey,
    fontSize: 15.sp,
    fontFamily: AppFont.poppinsMedium,
  );
  static TextStyle regGrey12Bold = TextStyle(
    color: AppColors.kGrey,
    fontSize: 12.sp,
    fontFamily: AppFont.poppinsBold,
  );

  static TextStyle regRed10 = TextStyle(
    color: AppColors.red,
    fontSize: 10.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regRed10Bold = TextStyle(
    color: AppColors.red,
    fontSize: 10.sp,
    fontFamily: AppFont.poppinsBold,
  );
  static TextStyle regRed8 = TextStyle(
    color: AppColors.red,
    fontSize: 8.sp,
    fontFamily: AppFont.poppinsRegular,
  );
  static TextStyle regRed8Bold = TextStyle(
    color: AppColors.red,
    fontSize: 8.sp,
    fontFamily: AppFont.poppinsBold,
  );
  static TextStyle regRed12 = TextStyle(
    color: AppColors.red,
    fontSize: 12.sp,
    fontFamily: AppFont.poppinsRegular,
  );
}
