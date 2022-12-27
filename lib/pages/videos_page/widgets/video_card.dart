import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 70.sp),
      height: size.width * 0.30,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.r),
            child: SizedBox(
                height: size.width * 0.25,
                width: size.width * 0.38,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/album_default.jpg",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        bottom: 5,
                        right: 15,
                        child: Chip(
                            elevation: 6,
                            backgroundColor: Colors.black87,
                            label: Text("05:20", style: bodyTextStyle)))
                  ],
                )),
          ),
          horizontalSubSpace(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Video Titel Name", style: heading3Bold),
                Text("Size : 5.30 MB", style: tileSubTitle),
              ],
            ),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert,
          color: textLightColor, size: 65.sp,
          ))
        ],
      ),
    );
  }
}
