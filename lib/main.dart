import 'package:bebop_music/pages/playing_page/playing_page.dart';
import 'package:bebop_music/pages/playlist_details/album_page.dart';
import 'package:bebop_music/pages/playlist_details/artists_page.dart';
import 'package:bebop_music/pages/playlist_details/playlist_page.dart';
import 'package:bebop_music/pages/search_page/search_page.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bebop_music/pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Sen',
          primarySwatch: primarySwitch,
          scaffoldBackgroundColor: backgroundColor,
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: primaryColor, selectionColor: textColor),
        ),
        home: const SafeArea(child: MainScreen()),
        // home: const SafeArea(child: PlayingPage()),
      ),
    );
  }
}
