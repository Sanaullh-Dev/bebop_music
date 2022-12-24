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
          selectedLabelStyle: menuTextSelected,
          selectedItemColor: primaryColor,
          unselectedItemColor: textLightColor,
          unselectedLabelStyle: menuText,
          onTap: (index) => setState(() {
                pageIndex = index;
              }),
          items: [
            iconItem(label: "Home", icon: FontAwesomeIcons.house),
            iconItem(label: "My Music", icon: FontAwesomeIcons.music),
            iconItem(label: "Video", icon: FontAwesomeIcons.film),
            iconItem(label: "Setting", icon: FontAwesomeIcons.user),
          ]),
    );
  }

  iconItem({required String label, required IconData icon}) =>
      BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.sp),
            child: Icon(icon, color: textLightColor, size: 60.sp),
          ),
          activeIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.sp),
            child: Icon(icon, color: primaryColor, size: 60.sp),
          ),
          label: label);
}
