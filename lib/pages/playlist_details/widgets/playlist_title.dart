import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitlePlaylist extends StatelessWidget {
  final Size size;
  const TitlePlaylist({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.65,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black12,
                      backgroundColor.withAlpha(100),
                      backgroundColor.withAlpha(190),
                      backgroundColor,
                    ]),
                // color: Colors.black45
              ),
              width: double.infinity,
              child: Image.asset("assets/images/album_default.jpg",
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Playlist Name", style: heading1Bold),
                  verticalSubSpace(),
                  Text("Created at 15 Dec 2022",
                      style:
                          heading3.copyWith(color: textColor.withAlpha(150))),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.headphones, color: textColor),
                      label: Text(" 10",
                          style: heading3.copyWith(color: textLightColor))),
                  verticalMainSpace(),
                  Row(
                    children: [
                      playButton(" Play All", FontAwesomeIcons.circlePlay),
                      horizontalMainSpace(),
                      playButton(" Shuffle", FontAwesomeIcons.shuffle)
                    ],
                  ),
                  verticalSubSpace(),
                  titleBar()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  playButton(String name, IconData icon) => Expanded(
        flex: 1,
        child: TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              padding: EdgeInsets.symmetric(vertical: 38.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.r)),
            ),
            icon: Padding(
              padding: EdgeInsets.only(right: 10.sp),
              child: Icon(icon, color: textColor, size: 60.sp),
            ),
            onPressed: () {},
            label: Text(name,
                style: TextStyle(fontSize: 40.sp, color: textColor))),
      );

  Widget titleBar() {
    // var btnSize = 80.sp;
    return Row(
      children: [
        Text("All", style: heading2Bold),
        horizontalSubSpace(),
        Text("(210)", style: heading3.copyWith(color: textLightColor)),
        const Spacer(),
        customIconBtn(onPress: () {}, icon: FontAwesomeIcons.plus),
        horizontalSubSpace(),
        IconButton(
            onPressed: () {},
            icon: SizedBox(
                width: 60.sp,
                height: 60.sp,
                child: Image.asset("assets/icons/sort_icon.png"))),
        horizontalSubSpace(),
        customIconBtn(onPress: () {}, icon: FontAwesomeIcons.listCheck),
      ],
    );
  }

  Widget customIconBtn(
          {required VoidCallback onPress, required IconData icon}) =>
      IconButton(
          onPressed: onPress, icon: Icon(icon, color: textColor, size: 50.sp));
}
