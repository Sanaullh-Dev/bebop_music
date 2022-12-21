import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTitleBar extends StatelessWidget {
  final String titleName;
  final bool moreBtn;
  final VoidCallback onPress;

  const ListTitleBar(
      {super.key, required this.titleName, required this.onPress, required this.moreBtn});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(titleName, style: heading2Bold),
            Visibility(
              visible: moreBtn,
              child: Icon(Icons.arrow_forward_ios, size: 50.sp, color: textColor,))
          ],
        ),
      ),
    );
  }
}
