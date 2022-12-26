import 'package:bebop_music/pages/playlist_details/share_widget/playlist_title.dart';
import 'package:bebop_music/share_widgets/songTile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  static const double _appBarBottomBtnPosition = 24.0;
  final _scrollCont = ScrollController();
  double pixelsPosition = 1;
  double opacityVal = 0;

  @override
  void initState() {
    super.initState();
    _scrollCont.addListener(() {
      if (_scrollCont.position.pixels <= 180 &&
          _scrollCont.position.pixels >= 0) {
        setState(() {
          pixelsPosition = _scrollCont.position.pixels.roundToDouble();
          opacityVal =
              double.parse((pixelsPosition / 179).toStringAsFixed(1));
          
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(opacityVal);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor.withOpacity(opacityVal),
        // elevation: 0,
        leadingWidth: 110.sp,
        leading: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 60.sp),
          onPressed: () {}, icon: Icon(Icons.arrow_back, size: 60.sp,)),
        title: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: opacityVal,
            child: Text("Playlist Name", style: appBarText)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, size: 60.sp,))],
      ),
      body: SingleChildScrollView(
        controller: _scrollCont,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitlePlaylist(size: size, animateValue: pixelsPosition),
            ListView.builder(
              padding: EdgeInsets.only(top: 1, left: 40.sp, right: 40.sp),
              shrinkWrap: true,
              primary: false,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return SongTile(
                    icon: Icons.music_note,
                    title: "new tile",
                    subTitle: "Album Name - Artists",
                    trailingWidget:
                        Icon(Icons.more_vert, color: textLightColor));
              },
            ),
          ],
        ),
      ),
    );
  }

}
