import 'dart:ui';

import 'package:bebop_music/share_widgets/list_title_bar.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FolderTab extends StatelessWidget {
  const FolderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTitleBar(titleName: "4 Folders", onPress: (){}, moreBtn: true,
          icon: ,
          )
        ],
      ),
    );
  }

  leadingIcon() => Container(
        decoration: BoxDecoration(
            color: backgroundLightColor,
            borderRadius: BorderRadius.circular(40.r),
            border: Border.all(color: primaryColor, width: 3.sp)),
        width: 140.w,
        height: double.infinity,
        alignment: Alignment.center,
        child: Image.asset("assets/icons/folder.png"),
      );
}
