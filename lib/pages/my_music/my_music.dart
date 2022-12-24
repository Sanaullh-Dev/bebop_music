import 'package:bebop_music/pages/my_music/tabs_screen/albums_tab.dart';
import 'package:bebop_music/pages/my_music/tabs_screen/artists_tab.dart';
import 'package:bebop_music/pages/my_music/tabs_screen/folder_tab.dart';
import 'package:bebop_music/pages/my_music/tabs_screen/playlist_tab.dart';
import 'package:bebop_music/pages/my_music/tabs_screen/songes_tab.dart';
import 'package:bebop_music/share_widgets/play_btn.dart';
import 'package:bebop_music/share_widgets/search_appbar.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMusicScreen extends StatefulWidget {
  const MyMusicScreen({super.key});

  @override
  State<MyMusicScreen> createState() => _MyMusicScreenState();
}

class _MyMusicScreenState extends State<MyMusicScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: searchAppBar(),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                isScrollable: true,
                unselectedLabelStyle: heading2,
                labelStyle: heading1Bold,
                indicatorColor: primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: primaryColor, width: 8.sp),
                ),
                labelPadding:
                    EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
                controller: _tabController,
                tabs: const [
                  Text("Songs"),
                  Text("Playlists"),
                  Text("Folders"),
                  Text("Artists"),
                  Text("Albums"),
                ]),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
              child: TabBarView(controller: _tabController, children: const [
                SongsTab(),
                MyPlaylistTab(),
                FolderTab(),
                ArtistsTab(),
                AlbumsTab()
              ]),
            ),
          )
        ],
      ),
    );
    // return
  }
}
