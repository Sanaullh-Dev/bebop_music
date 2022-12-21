import 'package:bebop_music/share_widgets/play_btn.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaylistCardMin extends StatelessWidget {
  const PlaylistCardMin({super.key});

  @override
  Widget build(BuildContext context) {
    double size = 270.w;
    return Container(
      width: size,
      height: 300,
      margin: EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
      decoration: BoxDecoration(
          color: primaryLightColor, borderRadius: BorderRadius.circular(40.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.r),
        child: Stack(
          children: [
            SizedBox(
              width: size,
              height: size,
              child: Image.asset('assets/logo.png', fit: BoxFit.fitHeight),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size * 0.4,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.black54,
                    ])),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size * 0.6,
                      child: Text("play list name",
                          style: tileSubTitleBold.copyWith(color: textColor)),
                    ),
                    PlayButton(
                        bgColor: textColor, onPress: () {}, btnSize: 60.sp)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
