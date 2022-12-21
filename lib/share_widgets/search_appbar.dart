import 'package:bebop_music/pages/home/home_page.dart';
import 'package:bebop_music/share_widgets/search_bar.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


PreferredSizeWidget searchAppBar() => PreferredSize(
      preferredSize: Size.fromHeight(180.h),
      child: AppBar(
        toolbarHeight: 180,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: backgroundLightColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: Icon(FontAwesomeIcons.barsStaggered,
              size: 65.sp, color: textColor),
        ),
        leadingWidth: 150.w,
        title: const SearchBar(),
        actions: [SizedBox(width: 80.w)],
      ),
    );
