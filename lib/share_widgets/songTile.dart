import 'package:bebop_music/share_widgets/leading_tile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongTile extends StatelessWidget {
  final IconData icon;
  final Widget trailingWidget;
  final String title;
  final String subTitle;
  const SongTile(
      {super.key,
      required this.icon,
      required this.trailingWidget,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        width: double.infinity,
        height: 160.w,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LeadingTile(icon: icon),
            SizedBox(width: 30.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: tileTitle),
                verticalSubSpace(),
                Text(subTitle, style: tileSubTitle),
              ],
            ),
            const Spacer(),
            trailingWidget
          ],
        ),
      );
}

class TileWithWidget extends StatelessWidget {
  final Widget leading;
  final Widget trailingWidget;
  final String title;
  final String? subTitle;
  const TileWithWidget(
      {super.key,
      required this.leading,
      required this.trailingWidget,
      required this.title,
      this.subTitle});

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
              borderRadius: BorderRadius.circular(15.r),
              child: Container(
                width: 140.w,
                height: double.infinity,
                color: textColor.withAlpha(30),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                child: leading,
              ),
            ),
            SizedBox(width: 30.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: tileTitle),
                subTitle != null ? verticalSubSpace() : const SizedBox(),
                subTitle != null
                    ? Text(subTitle!, style: tileSubTitle)
                    : const SizedBox(),
              ],
            ),
            const Spacer(),
            trailingWidget
          ],
        ),
      );
}
