import 'package:bebop_music/model/audio_file.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SongTile extends StatelessWidget {
  final Widget trailingWidget;
  const SongTile({super.key, required this.trailingWidget});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        width: double.infinity,
        height: 160.w,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: 160.w,
                height: double.infinity,
                color: primaryLightColor,
                alignment: Alignment.center,
                child: Icon(FontAwesomeIcons.music,
                    color: primaryColor, size: 60.sp),
              ),
            ),
            SizedBox(width: 30.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Doobey", style: tileTitle),
                verticalSubSpace(),
                Text("Album Name - Artists", style: tileSubTitle),
              ],
            ),
            trailingWidget
          ],
        ),
      );
}
