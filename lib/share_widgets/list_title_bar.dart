import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTitleBar extends StatelessWidget {
  final String titleName;
  final bool moreBtn;
  final VoidCallback onPress;
  final IconData? icon;
  const ListTitleBar(
      {super.key,
      required this.titleName,
      required this.onPress,
      required this.moreBtn,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(titleName, style: heading3Bold),
            moreBtn
                ? Icon(icon, size: 50.sp, color: textColor)
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class ListTitleBarWithWidget extends StatelessWidget {
  final String titleName;
  final Widget trailing;
  const ListTitleBarWithWidget(
      {super.key, required this.titleName, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(titleName, style: heading3Bold),
          const Spacer(),
          trailing
        ],
      ),
    );
  }
}
