import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayingPage extends StatefulWidget {
  const PlayingPage({super.key});

  @override
  State<PlayingPage> createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: size.width,
        
        padding: EdgeInsets.symmetric(horizontal: 50.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalMainSpace(),
            Icon(Icons.keyboard_arrow_down, size: 90.sp, color: textColor),
            verticalMainSpace(),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: SizedBox(
                  width: size.width * 0.8,
                  height: size.width * 0.8,
                  child: Image.asset(
                    "assets/images/album_default.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 80.sp),
            Text("Song Name", style: heading2Bold),
            verticalSubSpace(),
            Text("Album Name - Artists name",
                style: heading3.copyWith(color: textLightColor)),
            verticalMainSpace(),
            Slider(min: 0, max: 100, value: 50, onChanged: (value) {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("1:50", style: heading4,),
                Text("3:50", style: heading4,),                
              ],
            ),
            verticalMainSpace(),

          ],
        ),
      ),
    );
  }
}
