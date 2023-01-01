import 'dart:ui';

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
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:we_slide/we_slide.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final pagesList = const [HomePage(), MyMusic(), VideosPage(), MinePage()];
  final double _panelMinSize = 210.0;
  final _controller = WeSlideController();
  final _panel_controller = PanelController();
  final _footerController = WeSlideController(initial: true);
  double sliderPosition = 0;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SlidingUpPanel(
              controller: _panel_controller,
              maxHeight: _size.height - 330.sp,
              minHeight: 430.sp,
              color: Colors.transparent,
              onPanelSlide: (position) {
                setState(() {
                  sliderPosition = position;
                });
              },
              collapsed: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  height: 250.sp,
                  // color: Colors.black.shade200.withOpacity(0.2),
                  color: Colors.white12,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LinearProgressIndicator(
                        minHeight: 10.sp,
                        value: 0.5,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(primaryColor),
                        backgroundColor: textColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15.sp, left: 60.sp, right: 60.sp),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 200.sp,
                              height: 170.sp,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.r),
                                child: Image.asset(
                                    "assets/images/album_default.jpg",
                                    fit: BoxFit.cover),
                              ),
                            ),
                            horizontalMainSpace(),
                            SizedBox(
                                width: _size.width * 0.4,
                                child: Text("Album Name which playing",
                                    style: heading3Bold)),
                            const Spacer(),
                            PlaySmallButton(
                              onPress: () {},
                              icon: FontAwesomeIcons.play,
                              size: 30.sp,
                              iconColor: textColor,
                              bgColor: Colors.transparent,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.close,
                                  color: textColor,
                                  size: 100.sp,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              panel: const PlayingPanel(),
              body: pagesList[pageIndex],
            ),
          ),
          AnimatedPositioned(
            bottom: (sliderPosition * 100) - (sliderPosition * 200),
            left: 0,
            right: 0,
            duration: Duration(),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 60.sp, vertical: 25.sp),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60.r),
                  child: BottomNavigationBar(
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
                        iconItem(
                            label: "My Music", icon: FontAwesomeIcons.music),
                        iconItem(label: "Video", icon: FontAwesomeIcons.film),
                        iconItem(label: "Mine", icon: FontAwesomeIcons.user),
                      ]),
                ),
              ),
            ),
          )
        ],
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


// WeSlide(
//                 parallax: true,
//                 hideFooter: true,
//                 panelMinSize: _panelMinSize,
//                 panelMaxSize: _size.height,
//                 controller: _controller,
//                 footerController: _footerController,
//                 body: pagesList[pageIndex],
//                 panel: const PlayingPanel(),
//                 panelHeader: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
//                   child: Container(
//                     // color: Colors.black.shade200.withOpacity(0.2),
//                     color: Colors.white12,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         LinearProgressIndicator(
//                           minHeight: 10.sp,
//                           value: 0.5,
//                           valueColor:
//                               new AlwaysStoppedAnimation<Color>(primaryColor),
//                           backgroundColor: textColor,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               top: 15.sp, left: 60.sp, right: 60.sp),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               SizedBox(
//                                 width: 200.sp,
//                                 height: 170.sp,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(100.r),
//                                   child: Image.asset(
//                                       "assets/images/album_default.jpg",
//                                       fit: BoxFit.cover),
//                                 ),
//                               ),
//                               horizontalMainSpace(),
//                               SizedBox(
//                                   width: _size.width * 0.4,
//                                   child: Text("Apbum Name which playing",
//                                       style: heading3Bold)),
//                               const Spacer(),
//                               PlaySmallButton(
//                                 onPress: () {},
//                                 icon: FontAwesomeIcons.play,
//                                 size: 30.sp,
//                                 iconColor: textColor,
//                                 bgColor: Colors.transparent,
//                               ),
//                               IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.close,
//                                     color: textColor,
//                                     size: 100.sp,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
            