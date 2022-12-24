import 'package:bebop_music/share_widgets/play_btn.dart';
import 'package:bebop_music/share_widgets/songTile.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SongsTab extends StatelessWidget {
  const SongsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleBar(),
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

  Widget titleBar() {
    var btnSize = 80.sp;
    return Row(
      children: [
        Container(
          width: btnSize,
          height: btnSize,
          padding: EdgeInsets.only(left: 5.sp),
          decoration: BoxDecoration(
              color: popPrimaryColor, borderRadius: BorderRadius.circular(50)),
          child: Icon(FontAwesomeIcons.play,
              color: textColor, size: btnSize * 0.5),
        ),
        horizontalSubSpace(),
        Text(
          "Play all",
          style: heading2Bold,
        ),
        Text(
          " (210)",
          style: heading3.copyWith(color: textLightColor),
        ),
        const Spacer(),
        customIconBtn(onPress: () {}, icon: FontAwesomeIcons.shuffle),
        horizontalSubSpace(),
        IconButton(
            onPressed: () {},
            icon: SizedBox(
                width: 70.sp,
                height: 70.sp,
                child: Image.asset("assets/icons/sort_icon.png"))),
        horizontalSubSpace(),
        customIconBtn(onPress: () {}, icon: FontAwesomeIcons.listCheck),
      ],
    );
  }

  Widget customIconBtn(
          {required VoidCallback onPress, required IconData icon}) =>
      IconButton(
          onPressed: onPress, icon: Icon(icon, color: textColor, size: 60.sp));
}
