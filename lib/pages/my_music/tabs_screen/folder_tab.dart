import 'dart:ui';

import 'package:bebop_music/share_widgets/list_title_bar.dart';
import 'package:bebop_music/share_widgets/songTile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FolderTab extends StatelessWidget {
  const FolderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTitleBarWithWidget(
            titleName: "4 Folders",
            trailing: IconButton(
              onPressed: () {},
              icon: SizedBox(
                width: 60.sp,
                height: 60.sp,
                child: Image.asset("assets/icons/sort_icon.png"),
              ),
            ),
          ),
          TileWithWidget(
              leading: Image.asset("assets/icons/folder.png"),
              trailingWidget: Icon(
                Icons.more_vert,
                color: textLightColor,
                size: 70.sp,
              ),
              title: "Folder Name",
              subTitle: "8 Songs | Oct 15, 2022"),
          TileWithWidget(
              leading: Image.asset("assets/icons/folder.png"),
              trailingWidget: Icon(
                Icons.more_vert,
                color: textLightColor,
                size: 70.sp,
              ),
              title: "Folder Name",
              subTitle: "8 Songs | Oct 15, 2022"),
          TileWithWidget(
              leading: Image.asset("assets/icons/folder.png"),
              trailingWidget: Icon(
                Icons.more_vert,
                color: textLightColor,
                size: 70.sp,
              ),
              title: "Folder Name",
              subTitle: "8 Songs | Oct 15, 2022"),
          verticalMainSpace(),
          const ListTitleBarWithWidget(
              titleName: "Internal Storage", trailing: SizedBox()),
          TileWithWidget(
            leading: Icon(
              Icons.folder_rounded,
              color: primaryColor,
              size: 90.sp,
            ),
            trailingWidget: SizedBox(),
            title: "Internal Storage",
          ),
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
