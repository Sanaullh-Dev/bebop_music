import 'package:bebop_music/pages/playlist_details/share_widget/title_appbar.dart';
import 'package:bebop_music/share_widgets/play_all_bar.dart';
import 'package:bebop_music/share_widgets/playlist_card/playlist_card_med.dart';
import 'package:bebop_music/share_widgets/playlist_card/playlist_card_min.dart';
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
    final size = MediaQuery.of(context).size;

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            verticalMainSpace(),
            Padding(
              padding: EdgeInsets.only(left: 40.sp, top: 20.sp),
              child: Text(
                "Albums",
                style: heading2Bold,
              ),
            ),
            verticalMainSpace(),
            SizedBox(
              height: size.width * 0.28,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 40.sp),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return PlaylistCardMedium(
                      cardDesc: "Album Name",
                      cardSize: size.width * 0.25);
                },
              ),
            ),
            
            verticalMainSpace(),
            Padding(
              padding: EdgeInsets.only(left: 40.sp, top: 20.sp),
              child: Text(
                "Songs",
                style: heading2Bold,
              ),
            ),
            const PlayAllBar(),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 15,
              padding: EdgeInsets.symmetric(horizontal: 40.sp),
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
