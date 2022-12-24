import 'package:bebop_music/pages/home/home_page.dart';
import 'package:bebop_music/pages/my_music/my_music.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final pagesList = const [HomePage(), MyMusic(), HomePage(), MyMusic()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: pagesList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          fixedColor: primaryColor,
          selectedLabelStyle: menuTextSelected,
          unselectedLabelStyle: menuTextSelected.copyWith(color: Colors.red),
          onTap: (index) => setState(() {
                pageIndex = index;
              }),
          items: [
            BottomNavigationBarItem(
                icon:
                    Icon(Icons.home_filled, color: textLightColor, size: 60.sp),
                activeIcon:
                    Icon(Icons.home_filled, color: primaryColor, size: 60.sp),
                label: "Home",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.music,
                    color: textLightColor, size: 60.sp),
                activeIcon: Icon(FontAwesomeIcons.music,
                    color: primaryColor, size: 60.sp),
                label: "My Music"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.film,
                    color: textLightColor, size: 60.sp),
                activeIcon: Icon(FontAwesomeIcons.film,
                    color: primaryColor, size: 60.sp),
                label: "Video"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user, color: textLightColor),
                label: "Setting"),
          ]),
    );
  }
}
