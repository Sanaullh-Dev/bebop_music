import 'package:bebop_music/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayBigButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  final double size;
  final Color? bgColor;
  final Color iconColor;
  const PlayBigButton(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.size,
      this.bgColor,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: bgColor ?? Colors.transparent,
            padding: EdgeInsets.all(size),
            side: BorderSide(color: primaryColor, width: 5.sp),
            shape: const CircleBorder(),
            alignment: Alignment.topCenter),
        onPressed: onPress,
        child: Padding(
          padding: bgColor == primaryColor
              ? const EdgeInsets.only(left: 5)
              : EdgeInsets.zero,
          child: Icon(icon, color: iconColor, size: 70.sp),
        ));
  }
}



class PlaySmallButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  final double size;
  final Color? bgColor;
  final Color iconColor;
  const PlaySmallButton(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.size,
      this.bgColor,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: bgColor ?? Colors.transparent,
            padding: EdgeInsets.all(size),
            side: BorderSide(color: iconColor, width: 5.sp),
            shape: const CircleBorder(),
            alignment: Alignment.topCenter),
        onPressed: onPress,
        child: Padding(
          padding: EdgeInsets.only(left: 15.sp),
          child: Icon(icon, color: iconColor, size: 70.sp),
        ));
  }
}
