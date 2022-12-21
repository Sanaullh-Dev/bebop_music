import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration: BoxDecoration(
          color: secondaryLightColor,
          borderRadius: BorderRadius.circular(60.r)),
      // height: 20,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 30.w),
        child: Row(
          children: [
            Icon(FontAwesomeIcons.magnifyingGlass,
                size: 50.sp, color: textLightColor),
            SizedBox(width: 25.w),
            Text("Search Songs and Album ...",
                style: heading2.copyWith(color: textLightColor)),
          ],
        ),
      ),
    );
  }
}
