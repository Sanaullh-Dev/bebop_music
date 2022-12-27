import 'package:bebop_music/pages/videos_page/widgets/video_card.dart';
import 'package:bebop_music/share_widgets/list_title_bar.dart';
import 'package:bebop_music/share_widgets/search_appbar.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: searchAppBar(
          onPress: () {}, buildContext: context, isSearchPage: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Column(
          children: [
            ListTitleBarWithWidget(
                titleName: "53 Videos",
                trailing: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SizedBox(
                            width: 70.sp,
                            height: 70.sp,
                            child: Image.asset("assets/icons/sort_icon.png"))),
                    customIconBtn(
                        onPress: () {}, icon: FontAwesomeIcons.listCheck),
                  ],
                )),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return VideoCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customIconBtn(
          {required VoidCallback onPress, required IconData icon}) =>
      IconButton(
          onPressed: onPress, icon: Icon(icon, color: textColor, size: 60.sp));
}
