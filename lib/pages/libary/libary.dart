import 'package:bebop_music/share_widgets/play_btn.dart';
import 'package:bebop_music/share_widgets/search_appbar.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
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
                indicatorPadding: EdgeInsets.symmetric(horizontal: 50.w),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color:primaryColor, width: 8.sp),
                ),
                labelPadding:
                    EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
                controller: _tabController,
                tabs: [
                  Text("Songs"),
                  Text("Playlists"),
                  Text("Artists"),
                ]),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Center(child: Icon(Icons.home)),
              Center(child: Icon(Icons.music_note)),
              Center(child: Icon(Icons.file_download)),
            ]),
          )
        ],
      ),
    );
    // return
  }
}
