import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bebop_music/utils/app_colors.dart';

class LeadingTile extends StatelessWidget {
  final IconData icon;
  const LeadingTile({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: 140.w,
        height: double.infinity,
        color: primaryLightColor,
        alignment: Alignment.center,
        child: Icon(icon, color: primaryColor, size: 90.sp),
      ),
    );
  }
}
