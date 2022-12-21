import 'package:bebop_music/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle heading1 = TextStyle(
    color: textColor,
    fontWeight: FontWeight.w500,
    fontSize: 55.sp,
    fontFamily: "Sen");

TextStyle heading1Bold = heading1.copyWith(fontWeight: FontWeight.w700);

TextStyle heading2 = TextStyle(
  color: textColor,
  fontWeight: FontWeight.w500,
  fontSize: 45.sp,
  fontFamily: "Sen",
  // letterSpacing: 1.5
);

TextStyle heading2Bold = heading2.copyWith(fontWeight: FontWeight.w700);

TextStyle heading3 = TextStyle(
    color: textColor,
    fontWeight: FontWeight.w500,
    fontSize: 40.sp,
    fontFamily: "OpenSans");

TextStyle heading3Bold = heading3.copyWith(fontWeight: FontWeight.w700);

TextStyle tileTitle = TextStyle(
    color: textColor,
    fontSize: 40.sp,
    fontWeight: FontWeight.w600,
    fontFamily: "Sen");

TextStyle tileTitleBold = tileTitle.copyWith(fontWeight: FontWeight.w700);

TextStyle tileSubTitle = TextStyle(
  color: textLightColor,
  fontSize: 32.sp,
  fontFamily: "Sen",
  // overflow: TextOverflow.clip
);

TextStyle tileSubTitleBold = tileSubTitle.copyWith(fontWeight: FontWeight.w700);

TextStyle body =
    TextStyle(color: textColor, fontSize: 18.sp, fontFamily: "OpenSans");

TextStyle bodyStrong = body.copyWith(fontWeight: FontWeight.w700);

Widget verticalMainSpace() => SizedBox(height: 35.h);
Widget verticalSubSpace() => SizedBox(height: 25.h);
Widget horizontalMainSpace() => SizedBox(height: 15.w);
Widget horizontalSubSpace() => SizedBox(height: 7.w);
