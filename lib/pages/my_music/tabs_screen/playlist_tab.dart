import 'package:bebop_music/share_widgets/category_tile.dart';
import 'package:bebop_music/share_widgets/list_title_bar.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyPlayListTab extends StatelessWidget {
  const MyPlayListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.sp),
        child: Column(
          children: [
            ListTitleBar(
                titleName: "My Playlist", onPress: () {}, moreBtn: false),
            const CategoryTile(
              icon: FontAwesomeIcons.plus,
              title: "New playlist",
            ),
            const CategoryTile(
              icon: Icons.favorite,
              title: "Favorites",
            ),
            const CategoryTile(
              icon: Icons.favorite,
              title: "Save Play list name",
              subTitle: "10 Songs",
            ),
            verticalMainSpace(),
            ListTitleBar(
              icon: Icons.arrow_forward_ios,
                titleName: "Suggested Playlists", onPress: () {}, moreBtn: false),
            const CategoryTile(
              icon: Icons.watch_later,
              title: "Recently Played",
              subTitle: "10 Songs",
            ),
            const CategoryTile(
              icon: FontAwesomeIcons.music,
              title: "Last Added",
              subTitle: "10 Songs",
            ),
            const CategoryTile(
              icon: Icons.repeat_rounded,
              title: "Most Played",
              subTitle: "10 Songs",
            ),
            const CategoryTile(
              icon: Icons.article_sharp,
              title: "Top Artist",
              subTitle: "10 Songs",
            ),
            const CategoryTile(
              icon: Icons.album,
              title: "Top Album",
              subTitle: "10 Songs",
            ),
          ],
        ),
      ),
    );
  }
}
