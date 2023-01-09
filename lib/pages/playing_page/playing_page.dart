import 'dart:ui';
import 'package:bebop_music/share_widgets/play_btn.dart';
import 'package:bebop_music/share_widgets/play_button.dart';
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

    return ClipRRect(
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        color: Colors.white12,      
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            margin: EdgeInsets.only(top: 30.sp),
            width: size.width,
                
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // verticalMainSpace(),
                Icon(FontAwesomeIcons.chevronDown,
                    size: 70.sp, color: primaryColor),
                verticalMainSpace(),
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
                  padding: EdgeInsets.symmetric(horizontal: 100.sp),
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
                            Icons.favorite,
                            size: 90.sp,
                            color: primaryColor,
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
                      PlayBigButton(
                          onPress: () {},
                          icon: FontAwesomeIcons.backwardStep,
                          size: 50.sp,
                          iconColor: textColor),
                      PlayBigButton(
                          onPress: () {},
                          icon: FontAwesomeIcons.play,
                          size: 80.sp,
                          iconColor: textColor,
                          bgColor: primaryColor),
                      PlayBigButton(
                          onPress: () {},
                          icon: FontAwesomeIcons.forwardStep,
                          size: 50.sp,
                          iconColor: textColor),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.listUl,
                            color: textColor,
                          )),
                    ],
                  ),
                ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
