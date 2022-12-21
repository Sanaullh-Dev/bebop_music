import 'package:bebop_music/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayButton extends StatelessWidget {
  final VoidCallback onPress;
  final double btnSize;
  final Color bgColor;
  const PlayButton(
      {super.key,
      required this.onPress,
      required this.btnSize,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: btnSize,
        height: btnSize,
        padding: EdgeInsets.only(left: 5.sp),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(50)),
        child: Icon(FontAwesomeIcons.play,
            color: backgroundColor, size: btnSize * 0.5),
      ),
    );
  }
}
