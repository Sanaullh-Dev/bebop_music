import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: secondaryLightColor,
          borderRadius: BorderRadius.circular(100.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 35.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            horizontalMainSpace(),
            Icon(FontAwesomeIcons.magnifyingGlass,
                size: 50.sp, color: textLightColor),
            SizedBox(width: 25.w),
            SizedBox(
              width: size.width * 0.6,
              // height: 60.sp,
              child: Text("Search Songs and Album adasd dsasdasd ",
                  style: heading3.copyWith(
                      color: textLightColor,
                      overflow: TextOverflow.ellipsis)),
            ),
            
          ],
        ),
      ),
    );
  }
}
