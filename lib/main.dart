import 'package:bebop_music/pages/playlist_details/album_details.dart/album_details.dart';
import 'package:bebop_music/pages/playlist_details/playlist_details.dart';
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
        theme: ThemeData(fontFamily: 'Sen'),
        // home: const SafeArea(child: MainScreen()),
        home: const SafeArea(child: AlbumDetails()),
      ),
    );
  }
}
