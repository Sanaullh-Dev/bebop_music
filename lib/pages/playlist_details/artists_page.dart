import 'package:bebop_music/pages/playlist_details/share_widget/title_appbar.dart';
import 'package:bebop_music/share_widgets/play_all_bar.dart';
import 'package:bebop_music/share_widgets/playlist_card.dart';
import 'package:bebop_music/share_widgets/songTile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({super.key});

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
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
          ];
        },
        body: SingleChildScrollView(
          child: Column(children: [
            Text(
              "Albums",
              style: heading3Bold,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const PlaylistCardMax(
                    titleName: "Album Name",
                    subTitleName: "",
                    cardDesc: "", cardSize: 150);
                },
              ),
            ),
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
