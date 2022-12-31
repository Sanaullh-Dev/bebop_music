import 'dart:ui';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayingPanel extends StatefulWidget {
  const PlayingPanel({super.key});

  @override
  State<PlayingPanel> createState() => _PlayingPanelState();
}

class _PlayingPanelState extends State<PlayingPanel> {
  double _playingTime = 0;
  double _songTime = 45;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Container(
        margin: EdgeInsets.only(top: 30.sp),
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.3),
            borderRadius: BorderRadius.vertical(top: Radius.circular(90.sp))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // verticalMainSpace(),
            ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.9),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(165.sp))
                        ),
                padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 0),
                width: 200.sp,
                child: Icon(FontAwesomeIcons.chevronDown,
                    size: 70.sp, color: primaryColor),
              ),
            ),

            verticalSubSpace(),
            ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: SizedBox(
                  width: size.width * 0.80,
                  height: size.width * 0.80,
                  child: Image.asset(
                    "assets/images/album_default.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 80.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.sp),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Song Name", style: heading2Bold),
                      verticalSubSpace(),
                      Text("Album Name - Artists name",
                          style: heading3.copyWith(
                              color: primaryColor,
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        size: 90.sp,
                        color: Colors.redAccent,
                      )),
                ],
              ),
            ),
            verticalMainSpace(),
            Slider(
                inactiveColor: textColor,
                min: 0,
                max: _songTime,
                value: _playingTime,
                onChanged: (value) {
                  setState(() {
                    _playingTime = value;
                  });
                }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 65.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1:50", style: heading4),
                  Text("3:50", style: heading4),
                ],
              ),
            ),
            verticalMainSpace(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.repeat,
                        color: textColor,
                      )),
                  playingBtn(
                      onPress: () {},
                      icon: FontAwesomeIcons.backwardStep,
                      size: 30.sp,
                      color: textColor),
                  playingBtn(
                      onPress: () {},
                      icon: FontAwesomeIcons.play,
                      size: 70.sp,
                      color: textColor,
                      bgColor: primaryColor),
                  playingBtn(
                      onPress: () {},
                      icon: FontAwesomeIcons.forwardStep,
                      size: 30.sp,
                      color: textColor),
                  // SizedBox(
                  //   width: 90.sp,
                  //   height: 90.sp,
                  //   child: Image.asset('assets/icons/playlist.png'),
                  // )
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.listUl,
                        color: textColor,
                      )),
                ],
              ),
            ),
            // const Spacer(),
            // Container(
            //   color: secondaryLightColor,
            //   height: 220.sp,
            //   padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 25.sp),
            //   child: Column(
            //     children: [
            //       Center( child: Icon(FontAwesomeIcons.chevronUp, color: textColor,)),
            //       Row(
            //         children: [
            //           Text("data")
            //         ],

            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget playingBtn(
      {required VoidCallback onPress,
      required IconData icon,
      required double size,
      Color? bgColor,
      required Color color}) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: bgColor ?? Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: size),
            side: BorderSide(color: primaryColor, width: 5.sp),
            shape: const CircleBorder(),
            alignment: Alignment.topCenter),
        onPressed: onPress,
        child: Padding(
          padding: bgColor == primaryColor
              ? const EdgeInsets.only(left: 5)
              : EdgeInsets.zero,
          child: Icon(icon, color: color, size: 70.sp),
        ));
  }
}
