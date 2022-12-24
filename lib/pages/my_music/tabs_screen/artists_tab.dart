import 'package:bebop_music/share_widgets/list_title_bar.dart';
import 'package:bebop_music/share_widgets/playlist_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ArtistsTab extends StatelessWidget {
  const ArtistsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTitleBarWithWidget(
            titleName: "143 Artists",
            trailing: IconButton(
              onPressed: () {},
              icon: SizedBox(
                width: 60.sp,
                height: 60.sp,
                child: Image.asset("assets/icons/sort_icon.png"),
              ),
            ),
          ),
          AlignedGridView.count(
            primary: false,
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return const PlaylistCardMax(
                  titleName: "Artists Name with full details",
                  subTitleName: "",
                  cardDesc: "Play list name",
                );
              })
        ],
      ),
    );
  }
}
