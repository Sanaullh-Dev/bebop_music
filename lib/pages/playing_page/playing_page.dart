import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayingPage extends StatefulWidget {
  const PlayingPage({super.key});

  @override
  State<PlayingPage> createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  double _playingTime = 0;
  double _songTime = 45;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: 30.sp),
        width: size.width,
        decoration: BoxDecoration(
            // color: Colors.grey,
            borderRadius: BorderRadius.vertical(top: Radius.circular(90.sp))),
        padding: EdgeInsets.symmetric(horizontal: 50.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalMainSpace(),
            Icon(Icons.keyboard_arrow_down, size: 100.sp, color: textColor),
            verticalMainSpace(),
            ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: SizedBox(
                  width: size.width * 0.75,
                  height: size.width * 0.75,
                  child: Image.asset(
                    "assets/images/album_default.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 80.sp),
            Text("Song Name", style: heading2Bold),
            verticalSubSpace(),
            Text("Album Name - Artists name",
                style: heading3.copyWith(
                    color: primaryColor,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w600)),
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
              padding: EdgeInsets.symmetric(horizontal: 60.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1:50",
                    style: heading4,
                  ),
                  Text(
                    "3:50",
                    style: heading4,
                  ),
                ],
              ),
            ),
            verticalMainSpace(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: textColor.withAlpha(150)
                    ),
                    onPressed: onPressed, child: child)
                  IconButton(
                    style: ButtonStyle(
                      padding: EdgeInsets.all(15)
                    ),
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.backwardStep)),
                  IconButton(
                      onPressed: () {}, icon: Icon(FontAwesomeIcons.play)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.forwardStep)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
