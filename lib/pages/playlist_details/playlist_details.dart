import 'dart:ui';

import 'package:bebop_music/pages/playlist_details/widgets/playlist_title.dart';
import 'package:bebop_music/share_widgets/list_title_bar.dart';
import 'package:bebop_music/share_widgets/songTile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaylistDetails extends StatefulWidget {
  const PlaylistDetails({super.key});

  @override
  State<PlaylistDetails> createState() => _PlaylistDetailsState();
}

class _PlaylistDetailsState extends State<PlaylistDetails> {
  static const double _appBarBottomBtnPosition = 24.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text("Playlist Name"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitlePlaylist(size: size),
            SongTile(
                icon: Icons.music_note,
                title: "new tile",
                subTitle: "Album Name - Artists",
                trailingWidget: Icon(Icons.more_vert, color: textLightColor)),
            ListView.builder(
               padding: EdgeInsets.only(top: 1),
              shrinkWrap: true,
              primary: false,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return SongTile(
                icon: Icons.music_note,
                title: "new tile",
                subTitle: "Album Name - Artists",
                trailingWidget: Icon(Icons.more_vert, color: textLightColor));
              },
            ),
            SongTile(
                icon: Icons.music_note,
                title: "new tile",
                subTitle: "Album Name - Artists",
                trailingWidget: Icon(Icons.more_vert, color: textLightColor)),
          ],
        ),
      ),
    );
  }
}
