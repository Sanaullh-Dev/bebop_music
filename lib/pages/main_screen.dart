import 'package:bebop_music/pages/home/home_page.dart';
import 'package:bebop_music/pages/mine_page/mine_page.dart';
import 'package:bebop_music/pages/my_music/my_music.dart';
import 'package:bebop_music/pages/playing_page/playing_page.dart';
import 'package:bebop_music/pages/videos_page/videos_page.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_slide/we_slide.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final pagesList = const [HomePage(), MyMusic(), VideosPage(), MinePage()];
  final double _panelMinSize = 130.0;
  final _controller = WeSlideController();
  final _footerController = WeSlideController(initial: true);

  @override
  Widget build(BuildContext context) {
    final double _panelMaxSize = MediaQuery.of(context).size.height - 100;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: WeSlide(
        parallax: true,
        hideFooter: true,
        panelMinSize: _panelMinSize,
        panelMaxSize: _panelMaxSize,
        controller: _controller,
        footerController: _footerController,
        parallaxOffset: 0,
        body: pagesList[pageIndex],
        panel: PlayingPanel(),      
        panelHeader: Container(
          height: 200,
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
          child: Column(
            children: [
              // processin
              Row(            
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/images/album_default.jpg", fit: BoxFit.cover),
                  ),
                  Text("Apbum Name which playing", style: heading3Bold),
                  IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.play)),
                  IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.forwardStep))
                  ],
              ),
            ],
          ),
        ),
        footerHeight: 220.sp,
        footer: BottomNavigationBar(
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
              iconItem(label: "Mine", icon: FontAwesomeIcons.user),
            ]),
      ),
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
