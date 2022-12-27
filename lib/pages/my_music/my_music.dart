import 'package:bebop_music/pages/my_music/tabs_screen/albums_tab.dart';
import 'package:bebop_music/pages/my_music/tabs_screen/artists_tab.dart';
import 'package:bebop_music/pages/my_music/tabs_screen/folder_tab.dart';
import 'package:bebop_music/pages/my_music/tabs_screen/playlist_tab.dart';
import 'package:bebop_music/pages/my_music/tabs_screen/songes_tab.dart';
import 'package:bebop_music/pages/search_page/search_page.dart';
import 'package:bebop_music/share_widgets/search_appbar.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({super.key});

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> with SingleTickerProviderStateMixin {
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
      appBar: searchAppBar(
        isSearchPage: false,
        buildContext: context,
        onPress: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SearchPage())),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                isScrollable: true,
                unselectedLabelStyle: heading3,
                labelStyle: heading3Bold,
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
            child: TabBarView(controller: _tabController, children: const [
              SongsTab(),
              MyPlayListTab(),
              FolderTab(),
              ArtistsTab(),
              AlbumsTab()
            ]),
          )
        ],
      ),
    );
  }
}
