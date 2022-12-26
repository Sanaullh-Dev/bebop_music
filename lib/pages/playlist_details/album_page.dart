import 'package:bebop_music/pages/playlist_details/share_widget/title_appbar.dart';
import 'package:bebop_music/share_widgets/play_all_bar.dart';
import 'package:bebop_music/share_widgets/songTile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final _scrollCont = ScrollController();
  double pixelsPosition = 1;
  double opacityVal = 1;

  @override
  void initState() {
    super.initState();
    _scrollCont.addListener(() {
      if (_scrollCont.position.pixels <= 180 &&
          _scrollCont.position.pixels >= 0) {
        setState(() {
          pixelsPosition = _scrollCont.position.pixels.roundToDouble();
          opacityVal =
              double.parse(((180 - pixelsPosition) / 180).toStringAsFixed(1));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
        controller: _scrollCont,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            TitleAppBar(opacityVal: opacityVal, pixelsPosition: pixelsPosition),
            SliverAppBar(
              backgroundColor: backgroundColor,
              elevation: 10,
              pinned: true,
              collapsedHeight: 140.sp,
              toolbarHeight: 140.sp,
              title: PlayAllBar(),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(children: [
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 15,
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              itemBuilder: (BuildContext context, int index) {
                return SongTile(
                    icon: Icons.music_note,
                    title: "Doobey",
                    subTitle: "Album Name - Artists",
                    trailingWidget:
                        Icon(Icons.more_vert, color: textLightColor));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
