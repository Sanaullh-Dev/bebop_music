import 'package:bebop_music/pages/search_page/search_page.dart';
import 'package:bebop_music/share_widgets/list_title_bar.dart';
import 'package:bebop_music/share_widgets/playlist_card/playlist_card_min.dart';
import 'package:bebop_music/share_widgets/search_appbar.dart';
import 'package:bebop_music/share_widgets/songTile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OnAudioQuery _audioQuery = OnAudioQuery();

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
              FutureBuilder(
                future: _audioQuery.querySongs(
                    sortType: null,
                    orderType: OrderType.ASC_OR_SMALLER,
                    uriType: UriType.EXTERNAL,
                    ignoreCase: true),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return const SongTile(
                            icon: FontAwesomeIcons.music,
                            title: "Doobey",
                            subTitle: "Album Name - Artists",
                            trailingWidget: SizedBox());
                      },
                    );
                  } else {
                    return Center(
                      child: Text("Noting Found!"),
                    );
                  }
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
        label: Text(name, style: heading3Bold),
      ),
    );
