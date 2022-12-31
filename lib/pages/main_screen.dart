import 'package:bebop_music/pages/home/home_page.dart';
import 'package:bebop_music/pages/mine_page/mine_page.dart';
import 'package:bebop_music/pages/my_music/my_music.dart';
import 'package:bebop_music/pages/playing_page/playing_page.dart';
import 'package:bebop_music/pages/videos_page/videos_page.dart';
import 'package:bebop_music/share_widgets/play_button.dart';
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
  final double _panelMinSize = 180.0;
  final _controller = WeSlideController();
  final _footerController = WeSlideController(initial: true);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: WeSlide(
        parallax: true,
        hideFooter: true,
        panelMinSize: _panelMinSize,
        panelMaxSize: _size.height,
        controller: _controller,
        footerController: _footerController,
        body: pagesList[pageIndex],
        panel: const PlayingPanel(),
              
        panelHeader: Container(
          // height: 200,
          color: secondaryColor,
          // color: Colors.red.shade100,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LinearProgressIndicator(minHeight: 10.sp,
              value: 0.5,              
              valueColor: new AlwaysStoppedAnimation<Color>(primaryColor),  
              backgroundColor: textColor,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.sp , left: 20.sp, right: 20.sp),
                child: Row(            
                  children: [
                    SizedBox(
                      width: 200.sp,
                      height: 170.sp,
                      child: Image.asset("assets/images/album_default.jpg", fit: BoxFit.cover),
                    ),
                    horizontalSubSpace(),
                    SizedBox(
                      width: _size.width * 0.5,
                      child: Text("Apbum Name which playing", style: heading3Bold)),
                    const Spacer(),
                    PlaySmallButton(onPress: (){}, icon: FontAwesomeIcons.play,
                     size: 30.sp, iconColor: primaryColor, bgColor: textColor,),
                     PlaySmallButton(onPress: (){}, icon: FontAwesomeIcons.forwardStep,
                     size: 20.sp, iconColor: backgroundColor, bgColor: textColor),
                    // IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.play)),
                    // IconButt on(onPressed: (){}, icon: Icon(FontAwesomeIcons.forwardStep))
                    ],
                ),
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

      // bottomNavigationBar: BottomNavigationBar(
      //       currentIndex: pageIndex,
      //       type: BottomNavigationBarType.fixed,
      //       backgroundColor: backgroundColor,
      //       selectedLabelStyle: menuTextSelected,
      //       selectedItemColor: primaryColor,
      //       unselectedItemColor: textLightColor,
      //       unselectedLabelStyle: menuText,
      //       onTap: (index) => setState(() {
      //             pageIndex = index;
      //           }),
      //       items: [
      //         iconItem(label: "Home", icon: FontAwesomeIcons.house),
      //         iconItem(label: "My Music", icon: FontAwesomeIcons.music),
      //         iconItem(label: "Video", icon: FontAwesomeIcons.film),
      //         iconItem(label: "Mine", icon: FontAwesomeIcons.user),
      //       ]),
      
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
