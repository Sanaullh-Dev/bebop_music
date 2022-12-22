import 'package:bebop_music/share_widgets/leading_tile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subTitle;
  const CategoryTile(
      {super.key, required this.icon, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    var ck = subTitle ?? "";
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      width: double.infinity,
      height: 170.w,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingIcon(),
          SizedBox(width: 30.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: tileTitle),
              ck.isEmpty ? verticalSubSpace() : const SizedBox(),
              subTitle != null
                  ? Text(subTitle!, style: tileSubTitle)
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  leadingIcon() => Container(
        decoration: BoxDecoration(
            color: primaryLightColor,
            borderRadius: BorderRadius.circular(40.r),
            border: Border.all(color: primaryColor, width: 3.sp)),
        width: 140.w,
        height: double.infinity,
        alignment: Alignment.center,
        child: Icon(icon, color: primaryColor, size: 90.sp, ),
      );
}
