import 'package:bebop_music/share_widgets/list_title_bar.dart';
import 'package:bebop_music/share_widgets/playlist_card.dart';
import 'package:bebop_music/share_widgets/search_appbar.dart';
import 'package:bebop_music/share_widgets/songTile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: searchAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    actionButton(
                        name: "Favorites",
                        btnIcon: Icons.favorite,
                        iconColor: primaryColor,
                        bgColor: primaryLightColor),
                    SizedBox(width: 50.w),
                    actionButton(
                        name: "Shuffle",
                        btnIcon: FontAwesomeIcons.shuffle,
                        iconColor: secondaryColor,
                        bgColor: secondaryColor.withAlpha(60)),
                  ],
                ),
              ),
              verticalMainSpace(),
              ListTitleBar(
                titleName: "Recently Played",
                onPress: () {},
                moreBtn: true,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return const SongTile(
                      icon: FontAwesomeIcons.music,
                      title: "Doobey",
                      subTitle: "Album Name - Artists",
                      trailingWidget: SizedBox());
                },
              ),
              verticalMainSpace(),
              ListTitleBar(
                titleName: "My Playlist",
                onPress: () {},
                moreBtn: false,
              ),
              SizedBox(
                height: 300.w,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) =>
                        const PlaylistCardMin()),
              ),
              verticalMainSpace(),
              ListTitleBar(
                titleName: "Most Played",
                onPress: () {},
                moreBtn: true,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return const SongTile(
                    icon: FontAwesomeIcons.music,
                      title: "Doobey",
                      subTitle: "Album Name - Artists",
                      trailingWidget: SizedBox());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget actionButton(
        {required String name,
        required Color iconColor,
        required IconData btnIcon,
        required Color bgColor}) =>
    Expanded(
      flex: 1,
      child: TextButton.icon(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 50.h),
            backgroundColor: bgColor,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.r)))),
        onPressed: () {},
        icon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(btnIcon, color: iconColor, size: 80.sp),
        ),
        label: Text(name, style: heading2Bold),
      ),
    );
