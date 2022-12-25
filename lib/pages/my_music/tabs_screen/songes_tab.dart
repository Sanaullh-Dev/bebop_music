import 'package:bebop_music/share_widgets/play_all_bar.dart';
import 'package:bebop_music/share_widgets/songTile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongsTab extends StatelessWidget {
  const SongsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PlayAllBar(),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return SongTile(
                icon: Icons.music_note,
                title: "Doobey",
                subTitle: "Album Name - Artists",
                trailingWidget: Icon(Icons.more_vert, color: textLightColor));
            },
          ),
        ),
      ],
    );
  }
}
