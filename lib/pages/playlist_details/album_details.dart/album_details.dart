import 'package:bebop_music/share_widgets/play_all_bar.dart';
import 'package:bebop_music/share_widgets/songTile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class AlbumDetails extends StatefulWidget {
  const AlbumDetails({super.key});

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
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
    print(pixelsPosition);

    return Scaffold(
        backgroundColor: backgroundColor,
        body: NestedScrollView(
            controller: _scrollCont,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: backgroundColor,
                  collapsedHeight: 60,
                  leading: Icon(Icons.arrow_back),
                  leadingWidth: 80,
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                  ],
                  floating: false,
                  pinned: true,
                  expandedHeight: 250,
                  flexibleSpace: Stack(
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: opacityVal,
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.asset("assets/images/album_default.jpg",
                              fit: BoxFit.cover),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 15 - opacityVal * 10,
                              left: 20 + pixelsPosition * 0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Album Name", style: heading2Bold),
                              AnimatedOpacity(
                                  duration: const Duration(milliseconds: 500),
                                  opacity: opacityVal,
                                  child: Container(
                                      padding: EdgeInsets.only(top: 5),
                                      height: opacityVal * 40,
                                      child: Text("Album Name",
                                          style: heading3.copyWith(
                                              color: textLightColor)))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ];
            },
            body: Column(children: [
              SliverStickyHeader(
                header: PlayAllBar(),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => SongTile(
                        icon: Icons.music_note,
                        title: "Doobey",
                        subTitle: "Album Name - Artists",
                        trailingWidget:
                            Icon(Icons.more_vert, color: textLightColor)),
                    childCount: 4,
                  ),
                ),
              ),
            ])));
  }
}
