import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAppBar extends StatelessWidget {
  final double opacityVal;
  final double pixelsPosition;
  const TitleAppBar(
      {super.key, required this.opacityVal, required this.pixelsPosition});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      collapsedHeight: 150.sp,
      leading: Padding(
        padding: EdgeInsets.all(40.sp),
        child: Icon(Icons.arrow_back, color: textColor, size: 70.sp),
      ),
      leadingWidth: 80,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 40.sp),
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: textColor, size: 70.sp)),
        )
      ],
      floating: false,
      pinned: true,
      expandedHeight: 300,
      flexibleSpace: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: opacityVal,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset("assets/images/album_default.jpg",
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(
                  bottom: 40.sp - opacityVal * 6,
                  left: 60.sp + pixelsPosition * 0.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Album Name", style: heading2Bold),
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: opacityVal,
                      child: Container(
                          padding: EdgeInsets.only(top: 5),
                          height: opacityVal * 40,
                          child: Text("Album Name",
                              style:
                                  heading3.copyWith(color: textLightColor)))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
