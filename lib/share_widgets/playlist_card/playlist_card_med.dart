import 'package:bebop_music/share_widgets/play_btn.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaylistCardMedium extends StatelessWidget {
  final String cardDesc;
  final double cardSize;
  const PlaylistCardMedium(
      {super.key, required this.cardDesc, required this.cardSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardSize,
      height: cardSize,
      margin: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
      decoration: BoxDecoration(
          color: primaryLightColor, borderRadius: BorderRadius.circular(40.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.r),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(25.sp),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert, color: textColor, size: 70.sp)),
              ),
            ),
            SizedBox(
              width: cardSize,
              height: cardSize,
              // child: Image.asset('assets/images/default_img.jpg',
              child:
                  Image.asset('assets/images/album.jpg', fit: BoxFit.fitHeight),
            ),
            cardDesc.isEmpty
                ? const SizedBox()
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: cardSize * 0.3,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Colors.transparent,
                            Colors.black87,
                          ])),
                      padding: EdgeInsets.symmetric(
                          vertical: 5.sp, horizontal: 30.sp),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: cardSize * 0.6,
                            child: Text(cardDesc,
                                // "play list name",
                                maxLines: 2,
                                style: heading2.copyWith(
                                    fontSize: 28.sp,
                                    overflow: TextOverflow.ellipsis,
                                    height: 1.2,
                                    color: textColor,
                                    fontWeight: FontWeight.w600)),
                          ),
                          const Spacer(),
                          PlayButton(
                              bgColor: textColor,
                              onPress: () {},
                              btnSize: 60.sp),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
